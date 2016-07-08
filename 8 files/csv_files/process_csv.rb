require "csv"

CSV.foreach("sample.csv") do |f|
  p f if f.any?
end

arr_of_arrs = CSV.read("sample.csv")

arr_of_arrs.reject { |row| row.none? }

puts

CSV.parse("item1,item2,item3") do |row|
  p row
end

arr_of_arrs = CSV.parse("CSV,data,string")

p arr_of_arrs

CSV.open("subdir/file.csv", "wb") do |csv|
  csv << ["row", "of", "CSV", "data"]
  csv << %w(here is a second row)
end

CSV.open("subdir/file2.csv", "wb") do |csv|
  csv << ["Here", "is", "some", "CSV (\"comma separated value\")", "data"]
end

# to a string

csv_string = CSV.generate do |csv|
  csv << ["row", "of", "CSV", "data"]
  csv << ["another", "row"]
end

p csv_string

csv_string = ["CSV", "data"].to_csv
p csv_string
p csv_string.class
# shockingly enough, it's a string

csv_array = "CSV,String".parse_csv
p csv_array
p csv_array.class