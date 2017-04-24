def input_students
  students = []
  cohorts = %i(january february march april may june july
              august september october november december)

  puts "Please enter the names of the student"
  # get the first name
  name = gets.chomp
  # while the name is not empty repeat this
  while !name.empty? do
    puts "Which cohort will he/she attend? (month)"
    cohort = gets.chomp.downcase.to_sym
    while !cohorts.include?(cohort)
      puts "The cohort selected doesn't exist, try again:"
      cohort = gets.chomp.downcase.to_sym
    end
    # add student hash to the array
    students << {name: name, cohort: cohort}
    puts "Now we have #{students.count} #{plural?(students)}"
    # get another name from the user
    name = gets.chomp
  end
  students
end

def plural?(students)
  students.count > 1 ? "students" : "student"
end

def grouped_by_cohort(students)
  students.sort! {|a,b| a[:cohort] <=> b[:cohort]}
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
  puts "Overall, we have #{names.count} great #{plural?(names)}".center(40)
end




students = input_students
print_header
print_students(grouped_by_cohort(students))
print_footer(students)
