# list of all students
@students = []

def prompt
  print ">> "
end

def interactive_menu
  loop do
    # 1. print the menu and ask the user what to do
    print_menu
    # 2. read the input and save it into a variable
    prompt
    # 3. do what the user has asked
    process(gets.chomp)
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "9. Exit"
end

def process(selection)
  case selection
  when '1'
    input_students
  when '2'
    show_students
  when '3'
    save_students
  when '9'
    exit(0)
  else
    puts "I don't know what you meant, try again"
  end
end

def show_students
  print_header
  print_students_list
  print_footer
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  # get the first name
  prompt
  name = gets.chomp
  # while the name is not empty repeat this
  while !name.empty? do
    # add student hash to the array
    @students << {name: name, cohort: :november}
    puts "Now we have #{@students.count} students"
    # get another name from the user
    prompt
    name = gets.chomp
  end
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_students_list
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great students"
end

def save_students
  file = File.open("students.csv", "w")
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

interactive_menu
