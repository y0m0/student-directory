def input_students
  students = []
  puts "Please enter the names of the student"
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
  puts "The students of Villains Academy".center(40)
  puts "-" * 40
  puts "NAME".ljust(34) + "COHORT"
  puts ""
 end


def print_students(names)
  count = 0
  while count <= names.size - 1
    name = names[count][:name]
    cohort = names[count][:cohort]
    puts "#{name}".ljust(40-cohort.size) + "#{cohort}"

    count += 1
  end
end

def print_footer(names)
  puts "-" * 40
  puts "Overall, we have #{names.count} great students".center(40)
end




students = input_students
print_header
print_students(students)
print_footer(students)
