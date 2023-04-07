#  get the date
#  ask how many days is the usual period
#  ask when the last period ended
#  calculate the date of the next period
#  calculate how many days still remain
require 'date' 
puts "Welcome to the period calculator! What's your name?".center(100, "-")
name = gets.chomp.capitalize
puts "Hello #{name}! Today is the #{Date.today}.".center(100, "-")
require 'date' 
puts "Please #{name}, enter the date when your last period started in this format: (MM/DD/YYYY)"
lastP = gets.chomp 
start_date = Date.strptime(lastP, "%d/%m") 
puts "How many days is your period cycle usually?"
duration = gets.chomp.to_i 
next_period = start_date.next_day(duration)  
puts "Your next period should start on the #{next_period.strftime("%d/%m/%Y")}."