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
  calc_pregnancy_risk
end

def calc_pregnancy_risk
  if @next_period < Date.today # we had 5 days tolerance
    print_result_alert
  else
    print_result_ok
  end
end

def print_result_alert
  puts "Your next period should have started on the #{@next_period.strftime("%d/%m/%Y")}".center(100, "-")
  puts "This doesn't mean you are pregnant".center(100, "-")
  puts "If you usually have a regular period wait the #{(@next_period + 5).strftime("%d/%m/%Y")} and then get a pregnancy test".center(100, "-")  
end

def print_result_ok
    puts "Your next period should start on the #{@next_period.strftime("%d/%m/%Y")}."
end

welcome