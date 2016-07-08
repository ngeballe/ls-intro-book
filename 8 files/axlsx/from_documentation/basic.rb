require "axlsx"

p = Axlsx::Package.new
wb = p.workbook

wb.add_worksheet(:name => "Basic Worksheet") do |sheet|
  sheet.add_row ["First Column", "Second", "Third"]
  sheet.add_row [1, 2, 3]
  sheet.add_row ['     preserving whitespace']
end


p.serialize("example.xlsx")