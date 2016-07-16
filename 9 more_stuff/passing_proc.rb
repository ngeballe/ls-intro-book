# passing_proc.rb

def take_proc(proc)
  [1, 2, 3, 4, 5].each do |number|
    proc.call number
  end
end

proc = Proc.new do |number|
  puts "#{number}. Proc being called in the method!"
end

take_proc(proc)

## with block

# def yield_the_floor
#   [1, 2, 3, 4, 5].each do |number|
#     yield number
#   end
# end

[1, 2, 3, 4, 5].each do |number|
  puts "#{number} Yield the floor!"
end