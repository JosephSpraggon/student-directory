def interactive_menu
  students = []
  loop do
    puts "1. Input the students"
    puts "2. Show the students"
    puts "9. Exit"
    selection = gets.chomp
    case selection
    when "1"
      students = input_students("no name", "no age", "no cohort")
    when "2"
      print_header(students)
      print_by_cohort(students)
      print_footer(students)
    when "9"
      exit
    else
      puts "I don't know what you mean, try again"
    end
  end
end

def input_students(default_name, default_age, default_cohort)
  students = []
  while true do
    puts "Please enter the name of the student"
    puts "To re-enter student data, enter 'typo' "
    puts "To finish, enter 'quit'"
    name = gets.chop
    if name.empty?
      name = default_name
    end
    if name == "quit"
      break
    end
    if name == "typo"
      next
    end
    if name.split("").first.upcase == "J"
      if name.length < 12
        puts "Add #{name}'s age"
        age = gets.chop
        if age.empty?
          age = default_age
        end
        if age == "quit"
          break
        end
        if age == "typo"
          next
        end
        puts "add cohort for #{name}"
        cohort = gets.chop
        if cohort.empty?
          cohort = default_cohort
        end
        if cohort == "quit"
          break
        end
        if cohort == "typo"
          next
        end
        students << {name: name, cohort: cohort.to_sym, age: age}
          if students.count > 1
            puts "Now we have #{students.count} students"
          else
            puts "Now we have our first student"
          end
      end
    end
  end
  students
end

def print_header(students)
  if students.count >= 1
    puts "The students of Villians Academy".center(50)
    puts "-------------".center(50, "---")
  end
end

def print_by_cohort(students)
  cohorts = students.map do |student|
    student[:cohort]
  end
  cohorts.uniq.each do |cohort|
    puts "#{cohort} cohort".upcase.center(50)
    students.each do |student|
      if student[:cohort] == cohort
        puts "#{student[:name]}, #{student[:age]}"
      end
    end
  end
end

#def print(students)
  #students.each_with_index do |student, position|
    #puts "#{position + 1}. #{student[:name].capitalize}, #{student[:age]}, (#{student[:cohort].capitalize} cohort)".center(50)
  #end
#end

def print_footer(students)
  if students.count > 1
    puts "Overall, we have #{students.count} great students".center(50, " ")
  elsif students.count == 1
    puts "Overall, we have 1 great student".center(50, " ")
  end
end

interactive_menu
