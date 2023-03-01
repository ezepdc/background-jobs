puts "Cleaning database..."

User.destroy_all
Course.destroy_all
Enrollment.destroy_all

puts "Creating..."


# USERS

admin_user = User.create(
  name: "Admin User",
  email: "admin.user@not_mail.com",
  password: "123456",
  admin: true
)
puts "User with id: #{admin_user.id} has been created"

user = User.create(
  name: "María Teresa Montenegro Orta",
  email: "maria.teresa.montenegro.orta@not_mail.com",
  password: "123456",
  student: true
)
puts "User with id: #{user.id} has been created"

user = User.create(
  name: "César Correa Solano",
  email: "cesar.correa.solano@not_mail.com",
  password: "123456",
  student: true
)
puts "User with id: #{user.id} has been created"

user = User.create(
  name: "Luz Correa Ontiveros",
  email: "luz.correa.ontiveros@not_mail.com",
  password: "123456",
  student: true
)
puts "User with id: #{user.id} has been created"

user = User.create(
  name: "Elvira Caballero Montemayor",
  email: "elvira.caballero.montemayor@not_mail.com",
  password: "123456",
  student: true
)
puts "User with id: #{user.id} has been created"

user = User.create(
  name: "Luis Miguel Apodaca Rael",
  email: "luis.miguel.apodaca.rael@not_mail.com",
  password: "123456",
  student: true
)
puts "User with id: #{user.id} has been created"


# COURSES

course = Course.create(
  id: 1,
  title: "Design 488",
  user: admin_user
)
puts "Course with id: #{course.id} has been created"

course = Course.create(
  id: 2,
  title: "Criminology 425",
  user: admin_user
)
puts "Course with id: #{course.id} has been created"

course = Course.create(
  id: 3,
  title: "Computer Science 235",
  user: admin_user
)
puts "Course with id: #{course.id} has been created"

course = Course.create(
  id: 4,
  title: "Creative Arts 297",
  user: admin_user
)
puts "Course with id: #{course.id} has been created"

course = Course.create(
  id: 5,
  title: "Applied Science (Psychology) 543",
  user: admin_user
)
puts "Course with id: #{course.id} has been created"


# ENROLLMENTS

enrollment = Enrollment.create(
  course_id: 2,
  user_id: 1,
  pass_score: 50,
  progress: 75,
  score: 80
)
puts "Enrollment with id: #{enrollment.id} has been created"

enrollment = Enrollment.create(
  course_id: 1,
  user_id: 1,
  pass_score: 80,
  progress: 100,
  score: 100
)
puts "Enrollment with id: #{enrollment.id} has been created"

enrollment = Enrollment.create(
  course_id: 4,
  user_id: 1,
  pass_score: 50,
  progress: 90,
  score: 100
)
puts "Enrollment with id: #{enrollment.id} has been created"

enrollment = Enrollment.create(
  course_id: 5,
  user_id: 1,
  pass_score: 80,
  progress: 75,
  score: 80
)
puts "Enrollment with id: #{enrollment.id} has been created"

enrollment = Enrollment.create(
  course_id: 3,
  user_id: 1,
  pass_score: 50,
  progress: 75,
  score: 100
)
puts "Enrollment with id: #{enrollment.id} has been created"
