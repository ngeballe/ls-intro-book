# ex2.rb

# What will the following program print to the screen? What will it return?

# def execute(&block)
#   block
# end

# execute { puts "Hello from inside the execute method!" }



# Answer: It will print "Hello from inside the execute method!" It will return nil.

def execute(&block)
  block
end

execute { puts "Hello from inside the execute method!" }

# Wrong. Solution: It prints nothing. It returns the Proc object