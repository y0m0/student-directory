def input_students
  students = []
  puts "Please enter the names of the student"
  # get the first name
  name = gets.chomp # ~> NoMethodError: undefined method `chomp' for nil:NilClass
  puts "Date of birth? (dd-mm-yy)"
  birthday = gets.chomp
  puts "What's this student hobby?"
  hobby = gets.chomp

  # while the name is not empty repeat this
  while !name.empty? do
    # add student hash to the array
    students << {name: name, cohort: :november, hobby: hobby, birthday: birthday}
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
  count = 0
  while count <= names.size - 1
    puts "#{names[count][:name]} (#{names[count][:cohort]} cohort)"
    puts "Born: #{names[count][:birthday]}"
    puts "Hobbies: #{names[count][:hobby]}"

    count += 1
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end


students = input_students
print_header
print_students(students)
print_footer(students)

# =>

# >> Please enter the names of the student

# ~> NoMethodError
# ~> undefined method `chomp' for nil:NilClass
# ~>
# ~> /Users/daniele/Git/Projects/student-directory/Step 8/ex5.rb:5:in `input_students'
# ~> /Users/daniele/Git/Projects/student-directory/Step 8/ex5.rb:45:in `<main>'
