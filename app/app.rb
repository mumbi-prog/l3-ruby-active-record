require "pry"
require "active_record"

# TODO: CONNECT TO THE DATABASE
ActiveRecord::Base.establish_connection(
  adapter: "sqlite3",
  database: "db/school.db"
)

# TODO: CREATE TABLE
create_courses_table = <<-SQL
  CREATE TABLE IF NOT EXISTS courses(
    id INTEGER PRIMARY KEY,
    course_name TEXT,
    isactive BOOLEAN,
    duration INTEGER
  );
SQL
ActiveRecord::Base.connection.execute(create_courses_table)

# TODO: Create class that associates with the db table
class Course < ActiveRecord::Base
end

# TODO: VIEW METHODS AVAILABLE FOR TABLE
puts Course.methods

# TODO: COLUMN NAMES
puts Course.column_names

# TODO: CREATE NEW RECORD
course1 = Course.create(course_name: "SD", isactive: true, duration: 60)
course2 = Course.create(course_name: "Math", isactive: true, duration: 90)
course3 = Course.create(course_name: "Science", isactive: true, duration: 75)
course4 = Course.create(course_name: "English", isactive: true, duration: 45)

# TODO: VIEW ALL RECORDS
all_courses = Course.all
all_courses.each do |c|
  puts c.inspect
end

# TODO: FIND BY ID
course = Course.find(1)
puts course.inspect

# TODO: FIND BY GIVEN CONDITIONS
course = Course.find_by(course_name: "Math")
puts course.inspect

# TODO: UPDATE RECORDS
course.course_name = "Science"
course.save
puts course.inspect

course = Course.find(4)
course.course_name = "Science"
course.save
puts course.inspect