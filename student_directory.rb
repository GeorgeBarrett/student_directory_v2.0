@students = []
@cohorts = [
  "january",
  "february",
  "march",
  "april",
  "may",
  "june", 
  "july",
  "august",
  "september",
  "october",
  "november",
  "december"
]

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list"
  puts "4. Load the list"
  puts "9. Exit"
end

def interactive_menu
  loop do
    print_menu
    user_options(STDIN.gets.chomp)
  end
end

def input_students
  
  while true do
    puts "Please enter the students you would like to add"
    puts "type 'finished' when you are done"
    name = STDIN.gets.chomp
    cohort = ""
  
    break if name.downcase == "finished"
  
    puts "Please enter the cohort you would like to enroll this student on"
    cohort = STDIN.gets.chomp
  
    while !@cohorts.include?(cohort.downcase) do
      puts "I cannot enter #{name}, please enter a valid cohort"
      cohort = STDIN.gets.chomp
    end
  
    puts "Name: #{name}, Cohort: #{cohort}"
    puts "If you'd like to add this student to the Villan Academy list, type 'yes'"
    answer = STDIN.gets.chomp
    if answer.downcase == "yes"
      student = Hash.new('not specified')
      student[:name] = name
      student[:cohort] = cohort
      @students << student
    end
  end
end