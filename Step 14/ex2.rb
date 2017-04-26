# list of all students
@students = []

def prompt
  print ">> "
end

def interactive_menu
  loop do
    print_menu
    prompt
    process($stdin.gets.chomp)
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
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
  when '4'
    load_students
  when '9'
    exit(0)
  else
    puts "I don't know what you meant, try again"
  end
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  prompt
  name = $stdin.gets.chomp
  while !name.empty? do
    add_student(name)
    puts "Now we have #{@students.count} students"
    prompt
    name = $stdin.gets.chomp
  end
end

def add_student(name, cohort=:november)
  @students << { name: name, cohort: cohort }
end

def show_students
  print_header
  print_students_list
  print_footer
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

def load_students(filename="students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
    name, cohort = line.chomp.split(',')
    add_student(name, cohort.to_sym)
  end
  file.close
end

def try_load_students
  filename = ARGV.first || "students.csv"
  return if filename.nil?
  if File.exist?(filename)
    load_students(filename)
  else
    puts "Sorry, #{filename} doesn't exist."
    exit
  end
end

try_load_students
interactive_menu
