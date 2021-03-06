@students = []

def try_load_students
  filename = ARGV.first
  if filename.nil?
    load_students("students.csv")
  elsif File.exists?(filename)
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else
    puts "Sorry, #{filename} doesn't exist"
    exit
  end
end

def load_students(filename)
  File.open(filename, "r") do |file|
    file.readlines.each do |line|
      name, cohort = line.chomp.split(",")
      add_students(name, cohort)
    end
    puts "Students Loaded!"
  end
end

def save_students(filename)
  File.open(filename, "w") do |file|
    @students.each do |student|
      student_data = [student[:name], student[:cohort]]
      csv_line = student_data.join(",")
      file.puts csv_line
    end
  end
  puts "Students saved!"
end

def add_students(name = "no name", cohort = "november")
  @students <<{name: name, cohort: cohort.to_sym}
end

def input_students
  puts "Please enter the name of the student"
  puts "To finish, just hit return twice"
  name = STDIN.gets.chop
  while !name.empty? do
    add_students(name)
    puts "Now we have #{@students.count} students"
    name = STDIN.gets.chomp
  end
end

def interactive_menu
  try_load_students
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit"
end

def show_students
  print_header
  print_student_list
  print_footer
end

def process(selection)
  case selection
  when "1"
    input_students
  when "2"
    show_students
  when "3"
    puts "What would you like to save this list as?"
    filename = STDIN.gets.chomp
    if File.exists?(filename)
      save_students(filename)
    else
      puts "Sorry, that file doesn't exist"
    end
  when "4"
    puts "What file would you like to load?"
    filename = STDIN.gets.chomp
    if File.exists?(filename)
      load_students(filename)
    else
      puts "Sorry, that file doesn't exist"
    end
  when "9"
    exit
  else
    puts "I don't know what you mean, try again"
  end
end

def print_header
  puts "The students of Villians Academy"
  puts "-------------"
end

def print_student_list
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great students"
end

interactive_menu
