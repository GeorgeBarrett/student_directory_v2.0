require "csv"

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

def add_students(name, cohort)
  @students << {name: name, cohort: cohort}    
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

def save_students
  puts "Please enter the file name and extension that you would like to save to"
  filename = STDIN.gets.chomp
  
  CSV.open(filename, "wb") do |csv|
    @students.each do |student|
      student_data = [student[:name], student[:cohort]]
      csv << student_data
    end
  end
  puts "The student data has been saved"      
end

def load_students(filename)
  CSV.foreach(filename) do |row|
  name, cohort = row
  add_students(name, cohort)
  end
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_student_list
  @students.each do |student|
    puts "Name: #{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great students"
end

def show_students
  print_header
  print_student_list
  print_footer
end

def user_options(selection)
  case selection
  when "1"
    input_students
  when "2"
    show_students
  when "3"
    save_students
  when "4"
    puts "Enter the name of the file you would like to load?"
    filename = gets.chomp
    if File.exists?(filename)
      load_students(filename)
      puts "Student data loaded from #{filename} and can now be shown by selecting option 2"
    else 
      puts "Sorry, #{filename} doesn't exist."
    end
  when "9"
    exit   
  else
    puts "I don't know what you meant, try again"
  end
end