# ex5.rb

def execute(block)
  block.call
end

execute { puts "Hello from inside the execute method!" }

# Why the error?
# Because you didn't put an ampersand in front of the word block in "def execute(block)", so the method is expecting an argument other than a block. It expects 1 argument, but receives 0, hence the error.