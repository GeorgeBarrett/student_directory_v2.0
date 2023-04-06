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