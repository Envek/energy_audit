# encoding: utf-8
class Auditor::AuditsExporter
  def self.export(wb, period)
    @dist_audits = Audit.includes(:subject).where(:period_id => period.id, :subjects => {:type => 'District'}).order("subjects.id ASC")
    @auth_audits = Audit.includes(:subject).where(:period_id => period.id, :subjects => {:type => 'Authority'}).order("subjects.name ASC")
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
      header_height = 3
      headers = [
        {:titles => ["Информация о количестве проведенных энергетических обследованиях в бюджетных учреждениях муниципальных образований области за #{period.date.month} #{Russian.p period.date.month, "месяц", "месяца", "месяцев"} #{period.date.year} года", "", "", "", "", "", "", "", ""],
         :styles => [top_cell, top_cell, top_cell, top_cell, top_cell, top_cell, top_cell, top_cell, top_cell],
         :merges => ["A1:I1"]},
        {:titles => ["", "Муниципальное образование", "Информация по энергоаудиту", "", "", "", "", "Информация по энергосервисным контрактам", "" ],
         :styles => [header_cell, header_cell, header_cell, header_cell, header_cell, header_cell, header_cell, header_cell, header_cell],
         :merges => ["C2:G2", "H2:I2"]},
        {:titles => ["", "",
            "Количество зданий, сооружений, строений, находящихся в ведении исполнительного органа государственной власти или муниципального образования области",
            "Количество зданий, сооружений строений, по которым проведен энергоаудит по состоянию на #{period.start_date_localized} г.",
            "Количество зданий, сооружений строений, по которым необходимо провести энергоаудит ",
            "Фактическое количество зданий, сооружений строений, по которым проведен энергоаудит по состоянию на #{period.date_localized} г.",
            "% проведенных энергоаудитов",
            "Количество энергосервисных контрактов, заключенных по состоянию на #{period.start_date_localized} г.",
            "Количество энергосервисных контрактов, заключенных по состоянию на #{period.date_localized} г.",
          ],
         :styles => [header_cell, header_cell, header_cell, header_cell, header_cell, header_cell, header_cell, header_cell, header_cell],
         :merges => ["A2:A3", "B2:B3"]}
      ]
      # Printing preparations
      margins = {:left => 2.5/2.54, :right => 0.5/2.54, :top => 0.5/2.54, :bottom => 0.5/2.54, :header => 0, :footer => 0}
      setup = {:fit_to_width => 1, :orientation => :landscape}
      # Export first worksheet: Districts
      wb.add_worksheet(:name => District.model_name.human(:count => 2), :page_margins => margins, :page_setup => setup) do |sheet|
        headers.each do |hr|
          sheet.add_row hr[:titles], :style => hr[:styles]
          hr[:merges].each do |merge|
            sheet.merge_cells(merge)
          end
        end
        @dist_audits.each_with_index do |a, i|
          sheet.add_row [ i+1, a.subject.name, a.buildings, a.audited_before, a.audit_required, a.audited_in_period,
                          "=F#{i+1+header_height}/E#{i+1+header_height}", a.audit_contracts_before, a.audit_contracts_after ],
                          :style => [usual_cell, usual_cell, usual_cell, usual_cell, usual_cell, usual_cell, percent_cell, usual_cell, usual_cell]
        end
        s = header_height+1
        e = header_height+@dist_audits.count
        sheet.add_row [ "", "Итого", "=SUM(C#{s}:C#{e})", "=SUM(D#{s}:D#{e})", "=SUM(E#{s}:E#{e})",
         "=SUM(F#{s}:F#{e})",  "=F#{e+1}/E#{e+1}", "=SUM(H#{s}:H#{e})", "=SUM(I#{s}:I#{e})"],
          :style => [total_cell, total_cell, total_cell, total_cell, total_cell, total_cell, total_percent_cell, total_cell, total_cell]
        sheet.column_widths 3, 20, 20, 20, 20, 20, 20, 20, 20
      end
      # Export second worksheet: Authorities
      wb.add_worksheet(:name => Authority.model_name.human(:count => 2), :page_margins => margins, :page_setup => setup) do |sheet|
        headers.each do |hr|
          sheet.add_row hr[:titles], :style => hr[:styles]
          hr[:merges].each do |merge|
            sheet.merge_cells(merge)
          end
        end
        @auth_audits.each_with_index do |a, i|
          sheet.add_row [ i+1, a.subject.name, a.buildings, a.audited_before, a.audit_required, a.audited_in_period,
                          "=F#{i+1+header_height}/E#{i+1+header_height}", a.audit_contracts_before, a.audit_contracts_after ],
                          :style => [usual_cell, usual_cell, usual_cell, usual_cell, usual_cell, usual_cell, percent_cell, usual_cell, usual_cell]
        end
        s = header_height+1
        e = header_height+@auth_audits.count
        sheet.add_row [ "", "Итого", "=SUM(C#{s}:C#{e})", "=SUM(D#{s}:D#{e})", "=SUM(E#{s}:E#{e})",
         "=SUM(F#{s}:F#{e})",  "=F#{e+1}/E#{e+1}", "=SUM(H#{s}:H#{e})", "=SUM(I#{s}:I#{e})"],
          :style => [total_cell, total_cell, total_cell, total_cell, total_cell, total_cell, total_percent_cell, total_cell, total_cell]
        sheet.column_widths 3, 20, 20, 20, 20, 20, 20, 20, 20
      end
    end
    return wb
  end
end
