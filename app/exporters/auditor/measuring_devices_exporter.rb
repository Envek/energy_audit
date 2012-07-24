# encoding: utf-8
class Auditor::MeasuringDevicesExporter
  def self.export(wb, period)
    data = [[District, false], [Authority, true], [Organisation, true]].map do |subj_type, use_only_filled|
      areas = Area.includes(:measuring_devices => [:kind, :subject]).where(:measuring_devices => {:period_id => period.id}, :subjects => {:type => subj_type.to_s}).order("areas.id ASC, subjects.id ASC, kinds.id ASC")
      [areas, use_only_filled, subj_type]
    end
    # Export
    wb.styles do |s|
      # Cell styles
      top_cell = s.add_style :sz => 12, :font_name => 'Times New Roman', :alignment => { :horizontal=> :center, :vertical => :center }, :border => { :style => :thin, :color =>"00000000" }
      header_cell = s.add_style :sz => 8, :font_name => 'Times New Roman', :alignment => { :horizontal=> :center, :vertical => :center, :wrapText => true }, :border => { :style => :thin, :color =>"00000000" }
      usual_cell = s.add_style :sz => 12, :font_name => 'Times New Roman', :border => { :style => :thin, :color =>"00000000" }
      percent_cell = s.add_style :sz => 12, :font_name => 'Times New Roman', :border => { :style => :thin, :color =>"00000000" }, :format_code => "0.00%"
      total_cell = s.add_style :sz => 12, :font_name => 'Times New Roman', :b => true, :border => { :style => :thin, :color =>"00000000" }
      total_percent_cell = s.add_style :sz => 12, :font_name => 'Times New Roman', :b => true, :border => { :style => :thin, :color =>"00000000" }, :format_code => "0.00%"
      # Some preassumptions and prerequisites
      header_height = 3
      kinds = Kind.all
      val_types = [:start_value, :planned_value, :final_value]
      kinds_count = Kind.count
      kind_names = Kind.pluck(:name)
      kinds_count_array = Array.new(kinds_count, "")
      columns_count = 3 + (kinds_count + 1) * 3
      columns_count_array = Array.new(columns_count, "")
      # Printing preparations
      margins = {:left => 2.5/2.54, :right => 0.5/2.54, :top => 0.5/2.54, :bottom => 0.5/2.54, :header => 0, :footer => 0}
      setup = {:fit_to_width => 1, :orientation => :landscape}
      # Export worksheets
      data.each do |areas, use_only_filled_subjects, subject_type|
        wb.add_worksheet(:name => subject_type.model_name.human(:count => 2), :page_margins => margins, :page_setup => setup) do |sheet|
          headers = [
            {:titles => ["Информация об установленных приборах учета в бюджетных учреждениях муниципальных образований области за #{period.date.month-1} #{Russian.p period.date.month-1, "месяц", "месяца", "месяцев"} #{period.date.year} года", Array.new(columns_count-1).map!{ "" }].flatten,
             :styles => columns_count_array.map{ top_cell },
             :merges => ["A1:#{('A'.ord+columns_count-1).chr}1"]},
            {:titles => ["", "#{subject_type.model_name.human if subject_type}",
                I18n::t('common.attributes.measuring_device.start_value', :date => period.start_date_localized),
                Array.new(kinds_count).map!{""},
                I18n::t('common.attributes.measuring_device.planned_value', :date => period.start_date_localized),
                Array.new(kinds_count).map!{""},
                I18n::t('common.attributes.measuring_device.final_value', :date => period.date_localized),
                Array.new(kinds_count).map!{""},
                I18n::t('common.attributes.measuring_device.equipment_level'),
              ].flatten,
             :styles => columns_count_array.map{ header_cell },
             :merges => ["C2:#{('C'.ord+kinds_count).chr}2",
                         "#{('C'.ord+kinds_count+1).chr}2:#{('C'.ord+(kinds_count+1)*2-1).chr}2",
                         "#{('C'.ord+(kinds_count+1)*2).chr}2:#{('C'.ord+(kinds_count+1)*3-1).chr}2",
                        ]
            },
            {:titles => ["", "",
                Array.new(3).map { [kind_names, "Всего"] },
                ""
              ].flatten,
             :styles => columns_count_array.map{ header_cell },
             :merges => ["A2:A3", "B2:B3", "#{('A'.ord+columns_count-1).chr}2:#{('A'.ord+columns_count-1).chr}3"]}
          ]
          headers.each do |hr|
            sheet.add_row hr[:titles], :style => hr[:styles]
            hr[:merges].each do |merge|
              sheet.merge_cells(merge)
            end
          end
          # Export data
          current_row = header_height + 1
          areas.each_with_index do |area,i|
            sheet.add_row [ area.name, Array.new(columns_count-1, "")].flatten,
                          :style => columns_count_array.map{ top_cell }
            sheet.merge_cells("A#{current_row}:#{('A'.ord+columns_count-1).chr}#{current_row}")
            current_row += 1
            subjects = if use_only_filled_subjects
              area.measuring_devices.map{|d| d.subject }.uniq
            else
              subject_type.all
            end
            subjects.each_with_index do |subject, j|
              devices = area.measuring_devices.select{|d| d.subject_id == subject.id}
              current_column = 2
              sheet.add_row [ j+1, subject.name,
                              val_types.map{|v|
                                vals = kinds.map{|kind| devices.select{|d| d.kind_id == kind.id }.first.try(v)}
                                current_column += kinds_count
                                sum = "=SUM(#{('A'.ord+current_column-kinds_count).chr}#{current_row}:#{('A'.ord+current_column-1).chr}#{current_row})"
                                current_column += 1
                                [vals, sum]
                              },
                              "=#{('A'.ord+2+(kinds_count+1)*3-1).chr}#{current_row}/(#{('A'.ord+2+(kinds_count+1)-1).chr}#{current_row}+#{('A'.ord+2+(kinds_count+1)*2-1).chr}#{current_row})"
                            ].flatten,
                            :style => [Array.new(columns_count-1).map{ usual_cell }, percent_cell].flatten
              current_row += 1
            end
            sheet.add_row [ "", "Всего",
                              ("C".."#{('A'.ord+columns_count-2).chr}").map { |col|
                                "=SUM(#{col}#{current_row-subjects.count}:#{col}#{current_row-1})"
                              },
                              "=#{('A'.ord+2+(kinds_count+1)*3-1).chr}#{current_row}/(#{('A'.ord+2+(kinds_count+1)-1).chr}#{current_row}+#{('A'.ord+2+(kinds_count+1)*2-1).chr}#{current_row})"
                          ].flatten,
                          :style => [Array.new(columns_count-1).map{ total_cell }, total_percent_cell].flatten
            current_row += 1
          end
          sheet.column_widths *[4, 20, Array.new(columns_count-3).map{8}, 10].flatten
          # Split and freeze panels
          sheet.sheet_view.pane do |pane|
            pane.top_left_cell = "B#{header_height+1}"
            pane.state = :frozen_split
            pane.y_split = header_height
            pane.x_split = 1
            pane.active_pane = :bottom_right
          end
        end
      end
    end
    return wb
  end
end
