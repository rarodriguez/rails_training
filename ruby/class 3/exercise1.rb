#Read a positive integer value, and compute the following sequence: 
#If the number is even, halve it; 
#if it's odd, multiply by 3 and add 1. 
#Repeat this process until the value is 1, 
#printing out each value. 
#Finally print out how many of these operations you performed

#Inital value is 5 
#Next value is 16 
#Next value is 8 
#Next value is 4 
#Next value is 2 
#Final value 1, number of steps 6

a=5
i=0

puts "Inital value is #{a}"
until a == 1 do
i+=1
if a%2== 0
a=a/2
puts "Next value is #{a}"
else
a=(a*3)+1
puts "Next value is #{a}"
end
end
puts "Final value is #{a}, number of steps #{i}"









 

