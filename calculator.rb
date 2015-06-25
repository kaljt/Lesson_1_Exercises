require 'pry'

def say(word)
  puts "=> #{word}"
end
def add(val1,val2)
  val1.to_i + val2.to_i
end

def sub(val1,val2)
  val1.to_i-val2.to_i
end

def mult(val1,val2)
  val1.to_i*val2.to_i
end

def div(val1,val2)
  val1.to_f / val2.to_f
end

operation = nil

while operation != 'q'
say "Select an action"
say "1) Add 2) Subtract 3) Multiply 4) Divide  or q to quit"
operation = gets.chomp
if operation == 'q'
  break
end
#test validity of input
say "Enter first value: "
value1 = gets.chomp
say "Enter second value: "
value2 = gets.chomp

case operation
when "1"
  result = add(value1,value2)
when "2"
  result = sub(value1,value2)
when "3"
  #pry binding
  result = mult(value1,value2)
when "4"
  result = div(value1,value2)
else
  say "Invalid Entry"
  
end

#pry binding

say "Operation #{operation} performed on #{value1} and #{value2} gives a result of #{result}"

end