# list of all students
@students = []

def prompt
  print ">> "
end

def interactive_menu
  try_load_students
  loop do
    print_menu
    prompt
    process($stdin.gets.chomp)
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to a csv file"
  puts "4. Load the list from a csv file"
  puts "9. Exit"
end

def process(selection)
  case selection
  when '1'
    input_students
  when '2'
    show_students
  when '3'
    puts "Which file do you want to save to?"
    save_students
  when '4'
    puts "Which file do you want to load from?"
    try_load_students(pick_file)
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
  @students << { name: name, cohort: cohort.to_sym }
end

def show_students
  print_header
  print_students_list
  print_footer
end

def print_header
  puts "The students of Villains Academy"
  puts "-" * 10
end

def print_students_list
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer
  puts "-" * 10
  puts "Overall, we have #{@students.count} great students"
end

def save_students
  filename = pick_file
  File.open(filename, "w") do |file|
    @students.each do |student|
      student_data = [student[:name], student[:cohort]]
      csv_line = student_data.join(',')
      file.puts csv_line
    end
  end
  puts "The student list was succsessfully saved to #{filename}"
end

def load_students(filename)
  @students = [] # clear student list before importing the new list
  # open file and iterate over each line, then close file when block finishes
  File.foreach(filename) do |line|
    name, cohort = line.chomp.split(',')
    add_student(name, cohort)
  end
puts "The student list from '#{filename}' is now loaded."
end

def try_load_students(filename = ARGV.first || "students.csv")
  if File.exist?(filename)
    load_students(filename)
  else
    puts "Sorry, #{filename} doesn't exist."
    exit
  end
end

def pick_file
  puts "If no file name is given 'students.csv'"
  puts "will be used instead if available"
  print "filename: "
  filename = $stdin.gets.chomp
  filename.empty? ? "students.csv" : filename
end

interactive_menu
