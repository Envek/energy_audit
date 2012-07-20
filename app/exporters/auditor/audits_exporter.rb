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
        {:titles => ["Информация о количестве проведенных энергетических обследованиях в бюджетных учреждениях муниципальных образований области за #{period.date.month} #{Russian.p period.date.month, "месяц", "месяца", "месяцев"} #{period.date.year} года", (1..13).map{ "" }].flatten,
         :styles => (1..14).map{ top_cell },
         :merges => ["A1:N1"]},
        {:titles => ["", "Муниципальное образование",
            "Находящиеся в ведении ИОГВ или муниципального образования области, шт", "", "",
            "Проведен энергоаудит по состоянию на #{period.start_date_localized} г.", "",
            "Фактически проведено энергоаудитов по состоянию на #{period.date_localized} г.", "",
            "% проведенных энергоаудитов", "",
            "Количество энергосервисных контрактов, заключенных по состоянию на #{period.start_date_localized} г.",
            "Количество энергосервисных контрактов, заключенных по состоянию на #{period.date_localized} г., шт",
            "Объем энергосервисных контрактов, заключенных по состоянию на #{period.date_localized} г., тыс.руб.",
          ],
         :styles => (1..14).map{ header_cell },
         :merges => ["C2:E2", "F2:G2", "H2:I2", "J2:K2"]},
        {:titles => ["", "",
            "бюджетных учреждений любой формы собственности (юридических лиц), всего",
            "в т.ч. из графы бюджетных учреждений любой формы собственности (юридических лиц), подлежащих энергетическому обследованию",
            "зданий, сооружений, строений",
            "в бюджетных учреждениях любой формы собственности (юридических лиц), подлежащих энергетическому обследованию",
            "зданий, сооружений, строений",
            "в бюджетных учрежденях любой формы собственности (юридических лиц), подлежащих энергетическому обследованию",
            "зданий, сооружений, строений",
            "бюджетных учреждений любой формы собственности (юридических лиц), подлежащих энергетическому обследованию",
            "зданий, сооружений, строений",
          ],
         :styles => (1..14).map{ header_cell },
         :merges => ["A2:A3", "B2:B3", "L2:L3", "M2:M3", "N2:N3"]}
      ]
      # Printing preparations
      margins = {:left => 2.5/2.54, :right => 0.5/2.54, :top => 0.5/2.54, :bottom => 0.5/2.54, :header => 0, :footer => 0}
      setup = {:fit_to_width => 1, :orientation => :landscape}
      # Export worksheets
      [[@dist_audits, District], [@auth_audits, Authority]].each do |audits, subj_type|
        wb.add_worksheet(:name => subj_type.model_name.human(:count => 2), :page_margins => margins, :page_setup => setup) do |sheet|
          headers.each do |hr|
            sheet.add_row hr[:titles], :style => hr[:styles]
            hr[:merges].each do |merge|
              sheet.merge_cells(merge)
            end
          end
          audits.each_with_index do |a, i|
            row = i+1+header_height
            sheet.add_row [ i+1, a.subject.name, Audit::significant_fields[0...7].map{|f| a[f]},
                            "=(F#{row}+H#{row})/D#{row}", "=(G#{row}+I#{row})/E#{row}",
                            Audit::significant_fields[-3..-1].map{|f| a[f]}, ].flatten,
                          :style => [(1..9).map{ usual_cell }, percent_cell, percent_cell, (12..14).map{ usual_cell }].flatten
          end
          s = header_height+1
          e = header_height+@dist_audits.count
          sheet.add_row [ "", "Итого", "=SUM(C#{s}:C#{e})", "=SUM(D#{s}:D#{e})", "=SUM(E#{s}:E#{e})",
            "=SUM(F#{s}:F#{e})", "=SUM(G#{s}:G#{e})", "=SUM(H#{s}:H#{e})", "=SUM(I#{s}:I#{e})",
            "=(F#{e+1}+H#{e+1})/D#{e+1}", "=(G#{e+1}+I#{e+1})/E#{e+1}",
            "=SUM(L#{s}:L#{e})", "=SUM(M#{s}:M#{e})", "=SUM(N#{s}:N#{e})"],
            :style => [(1..9).map{ total_cell }, total_percent_cell, total_percent_cell, (12..14).map{ total_cell }].flatten
          sheet.column_widths 3, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20
        end
      end
    end
    return wb
  end
end
