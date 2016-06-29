# ex2_stop_loop.rb

while true
  puts "Your wish is my command."
  input = gets.chomp
  break if input == "STOP"
end

# book's solution:
x = ""
while x != "STOP" do
  puts "Hi, how are you feeling?"
  ans = gets.chomp
  puts "Want me to ask you again?"
  x = gets.chomp
end