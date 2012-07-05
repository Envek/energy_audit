# encoding: utf-8
class Auditor::ConsumptionsExporter
  def self.export(wb, period)
    # Подготовка данных
    c_1 = Consumption.includes(:subject).where(:period_id => period.id, :subjects => {:type => 'District'}).order("subjects.id ASC")
    s_1 = District.all
    c_2 = Consumption.includes(:subject).where(:period_id => period.id, :subjects => {:type => 'Authority'}).order("subjects.name ASC")
    s_2 = c_2.map{|d| d.subject }.uniq
    data = [{:cons => c_1, :subs => s_1, :t => District}, {:cons => c_2, :subs => s_2, :t => Authority}]
    # Export
    wb.styles do |s|
      # Cell styles
      top_cell = s.add_style :sz => 12, :font_name => 'Times New Roman', :alignment => { :horizontal=> :center, :vertical => :center }, :border => { :style => :thin, :color =>"00000000" }
      header_cell = s.add_style :sz => 8, :font_name => 'Times New Roman', :alignment => { :horizontal=> :center, :vertical => :center, :wrapText => true }, :border => { :style => :thin, :color =>"00000000" }
      usual_cell = s.add_style :sz => 12, :font_name => 'Times New Roman', :border => { :style => :thin, :color =>"00000000" }
      percent_cell = s.add_style :sz => 12, :font_name => 'Times New Roman', :border => { :style => :thin, :color =>"00000000" }, :format_code => "0.00%"
      total_cell = s.add_style :sz => 12, :font_name => 'Times New Roman', :b => true, :border => { :style => :thin, :color =>"00000000" }
      total_percent_cell = s.add_style :sz => 12, :font_name => 'Times New Roman', :b => true, :border => { :style => :thin, :color =>"00000000" }, :format_code => "0.00%"
      # Some preassumptions
      header_height = 2
      headers = [
        {:titles => ["", "Муниципальное образование", "Информация по энергоаудиту", "", "", "", "", "Информация по энергосервисным контрактам", "" ],
         :styles => [header_cell, header_cell, header_cell, header_cell, header_cell, header_cell, header_cell, header_cell, header_cell],
         :merges => ["C2:G2", "H2:I2"]},
        {:titles => ["", "",
          
          ],
         :styles => [header_cell, header_cell, header_cell, header_cell, header_cell, header_cell, header_cell, header_cell, header_cell],
         :merges => ["A2:A3", "B2:B3"]}
      ]
      # Printing preparations
      margins = {:left => 2.5/2.54, :right => 0.5/2.54, :top => 0.5/2.54, :bottom => 0.5/2.54, :header => 0, :footer => 0}
      setup = {:fit_to_width => 1, :orientation => :landscape}
      data.each do |dataset|
        wb.add_worksheet(:name => dataset[:t].model_name.human(:count => 2), :page_margins => margins, :page_setup => setup) do |sheet|
          header_titles = [
            dataset[:t].model_name.human,
            Consumption.human_attribute_name(:resource),
            Consumption.human_attribute_name(:prev_cons, :start_year => period.date.year-2, :period_year => period.date.year), "",
            Consumption.human_attribute_name(:approved_year_cons, :period_year => period.date.year), "",
            Consumption.human_attribute_name(:approved_period_cons, :start_date => period.start_date_localized), "",
            Consumption.human_attribute_name(:actual_cons, :start_date => period.start_date_localized), "",
            Consumption.human_attribute_name(:deviation, :start_year => period.date.year-2, :period_year => period.date.year), "",
            Consumption.human_attribute_name(:deviation_reason)
          ]
          sheet.add_row header_titles, :style => (1..13).map{ header_cell }
          sheet.add_row ([""]+(1..12).to_a), :style => (1..13).map{ header_cell }
          ["C1:D1", "E1:F1", "G1:H1", "I1:J1", "K1:L1"].each { |range| sheet.merge_cells(range) }
          # Main data
          current_row = 3
          dataset[:subs].each do |subject|
            consumptions = dataset[:cons].select{|c| c.subject_id == subject.id }
            consumptions.each_with_index do |cons, index|
              name =  index.zero?? subject.name : ""
              data = [name, cons.resource.name, cons.prev_cons_units, cons.prev_cons_monetary, 
                      cons.approved_year_cons_units, cons.approved_year_cons_monetary,
                      cons.approved_period_cons_units, cons.approved_period_cons_monetary,
                      cons.actual_cons_units, cons.actual_cons_monetary, cons.deviation_units, cons.deviation_monetary, cons.reason
              ]
              sheet.add_row data, :style => (1..13).map{ usual_cell }
            end
            sheet.merge_cells("A#{current_row}:A#{(current_row+=consumptions.count)-1}") unless consumptions.count.zero?
          end
          sheet.column_widths 20, 15, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10
        end
      end
    end
    return wb
  end
end
