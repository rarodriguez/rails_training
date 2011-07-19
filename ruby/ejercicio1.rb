def gen_array
	a = Array.new
	(1..10).to_a.each do
		a << rand(10000)
	end
	puts a.inspect
	a
end

def sum_array(array_to_sum)
	sum = 0
	array_to_sum.each do |x|
		sum += x
	end
	sum
end

puts sum_array gen_array



xyz = 5
if xyz > 4
  puts "the variable is greater than 4" 
  if xyz == 5
    puts "the variable is 5"
  elsif xyz > 5 && xyz < 10
    puts "xyz is greater than 5 and less than 10"
  else
    puts "xyz is greater than 10"
  end
else
  puts "the variable is not greater than 5"
  
  puts "One line conditional" if xyz == 1
end

condicion = 5
variable = condicion == 1 ? 'es 1' : 'no es 1'

# EXERCISE 2
# Write a method that asks for a year and after processing display:
# If the year is a leap-year
# The number of days that this year has
#Hint: Leap-years are divisible by 4 and not divisible by 100
#unless is also divisible by 400.

def get_year
gets.chomp.to_i
end

def calculate_days get_year

if(get_year % 4 == 0)
puts "Si es biciesto#{get_year}"
puts"Numero de dias#{366}"
end
end

#puts calculate_days get_year

#Write a method that receives one argument (score) 
#and displays a message according with this rule.
#Lower than 50: “You ought try harder the next time” 
#Between 50 and 70: “You almost reach your goal, keep trying”
#Between 70 and 85: “Good job”
#Between 85 and 100: “You did an amazing job, Congratulations!”
def give_message score 
	case
		when score < 50 then puts "You ought try harder the next time"
		when  score < 70 && score >= 50 then puts "Keep trying" 
	end
end	

give_message 60



