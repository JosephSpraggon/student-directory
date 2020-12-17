=begin
students = [
  {name: "Dr. Hannibal Lecter", cohort: :november},
  {name: "Darth Vader", cohort: :november},
  {name: "Nurse Ratched", cohort: :november},
  {name: "Michael Corleone", cohort: :november},
  {name: "Alex DeLarge", cohort: :november},
  {name: "The Wicked Witch of the West", cohort: :november},
  {name: "Terminator", cohort: :november},
  {name: "Freddy Krueger", cohort: :november},
  {name: "The Joker", cohort: :november},
  {name: "Joffrey Baratheon", cohort: :november},
  {name: "Norman Bates", cohort: :november}
]
=end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  students = []
  name = gets.chomp
  while !name.empty? do
    if name.split("").first.upcase == "J"
      if name.length < 12
        puts "Add #{name}'s age"
        age = gets.chomp
        students << {name: name, cohort: :november, age: age}
          puts "Now we have #{students.count} students"
      end
    end
    name = gets.chomp
  end
  students
end

def print_header
  puts "The students of Villians Academy".center(50)
  puts "-------------".center(50, "---")
end

def print(students)
  count = 0
  until count >= students.count
    students.each_with_index do |student, position|
      puts "#{position + 1}. #{student[:name]}, #{student[:age]}, (#{student[:cohort]} cohort)".center(50)
    end
    count += students.count
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

students = input_students
print_header
print(students)
print_footer(students)
