require 'date' 

def welcome
  puts "Welcome to the period calculator! What's your name?".center(100, "-")
  @name = gets.chomp.capitalize
  puts "Hello #{@name}! Today is the #{DateTime.now.strftime("%d/%m/%Y")}.".center(100, "-")
  get_last_period
end

def get_last_period
  puts "Please #{@name}, enter the date when your last period started in this format: (MM/DD/YYYY)"
  @last_period = Date.strptime(gets.chomp, "%d/%m") 
  cycle_length
end

def cycle_length
  puts "How many days is your period cycle usually?"
  @duration = gets.chomp.to_i 
  next_period_calc
end

def next_period_calc
  @next_period = @last_period.next_day(@duration)  
  print_result
end

def print_result
    puts "Your next period should start on the #{@next_period.strftime("%d/%m/%Y")}."
end

welcome