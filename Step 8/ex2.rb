def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first name
  name = gets.chomp
  # while the name is not empty repeat this
  while !name.empty? do
    # add student hash to the array
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    # get another name from the user
    name = gets.chomp
  end
  students
end

 def print_header
  puts "The students of Villains Academy"
  puts "-------------"
 end


def print_students(names)
  puts "Which student you want to check?"
  print "Name begins with: "
  letter = gets.chomp.downcase!
  puts "Here are the students who's names begin with '#{letter}'"
  result = names.select {|student| student[:name][0].downcase.start_with?(letter)}

  result.each_with_index do |student, i|
    puts "#{i + 1}. #{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

students = input_students
print_students(students)
print_footer(students)
