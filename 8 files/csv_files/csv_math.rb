# csv_math.rb

require "csv"
require "bigdecimal"

def values_to_floats(hsh)
  Hash[hsh.keys.zip(hsh.values.map { |value| value.to_f })]
end


arr_of_arrs = CSV.read("subdir/numbers.csv")

data_as_numbers = []
row_sums = {}
row_avgs = {}

arr_of_arrs.each.with_index do |row, row_index|
  next if row.none?
  row_numbers = []
  row.each.with_index do |item, column_index|
    if item =~ /\d+/ 
      item = BigDecimal(item)
    end
    p "Row #{row_index}, Col #{column_index}: #{item.to_f}"
    # convert #s to decimals
    p item
    # a.map do |el|
    #   el.to_i if el =~ /\d+/
    # end
    row_numbers << item
  end
  data_as_numbers << row_numbers

  row_sum = row_numbers.reduce(:+)
  puts row_sum.to_f
  row_sums[row_index] = row_sum

  row_avg = row_sum / row.size
  puts row_avg.to_f
  row_avgs[row_index] = row_avg

  puts
end  



p arr_of_arrs

data_as_numbers.each do |row|
  p row.map { |item| item.to_f }
end

row_sums.map do |k, v|
  p [k, v.to_f]
end

puts

p row_sums
row_sums_floats = values_to_floats(row_sums)
p row_sums_floats

puts

p row_avgs
p row_avgs_floats = values_to_floats(row_avgs)


# save results to a new CSV file

CSV.open("subdir/numbers_processed.csv", "wb") do |csv|
  # create a header row of blanks, then Sum & Average
  csv << [""] * (arr_of_arrs[0].size + 1) + ["Sum", "Average"]
  arr_of_arrs.each.with_index do |row, index|
    row_to_write = row
    if row.any?
      row_to_write = row + ["", row_sums_floats[index], row_avgs_floats[index]]
    else
      row_to_write = row
    end
    csv << row_to_write
  end
  #csv << ["row", "of", "CSV", "data"]
end