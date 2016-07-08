# Look at Ruby's merge method. Notice that it has two versions. What is the difference between merge and merge!? Write a program that uses both and illustrate the differences.



# The difference is that merge! is destructive; it changes the hash calling it.

# merge

spanish = {one: "uno", two: "dos", three: "tres"}
french = {one: "un", two: "deux", three: "trois", four: "quatre"}

franish = french.merge(spanish) 

p franish # {one: "uno", two: "dos", three: "tres", four: "quatre"}
p french # same as before
p spanish # same as before

# merge!

french.merge!(spanish)

p french # changed, to {one: "uno", two: "dos", three: "tres", four: "quatre"}


