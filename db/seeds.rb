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
  password: "123456"
)
puts "User with id: #{user.id} has been created"

user = User.create(
  name: "César Correa Solano",
  email: "cesar.correa.solano@not_mail.com",
  password: "123456"
)
puts "User with id: #{user.id} has been created"

user = User.create(
  name: "Luz Correa Ontiveros",
  email: "luz.correa.ontiveros@not_mail.com",
  password: "123456"
)
puts "User with id: #{user.id} has been created"

user = User.create(
  name: "Elvira Caballero Montemayor",
  email: "elvira.caballero.montemayor@not_mail.com",
  password: "123456"
)
puts "User with id: #{user.id} has been created"

user = User.create(
  name: "Luis Miguel Apodaca Rael",
  email: "luis.miguel.apodaca.rael@not_mail.com",
  password: "123456"
)
puts "User with id: #{user.id} has been created"


# COURSES

course = Course.create(
  title: "Design 488",
  user: admin_user
)
puts "Course with id: #{course.id} has been created"

course = Course.create(
  title: "Criminology 425",
  user: admin_user
)
puts "Course with id: #{course.id} has been created"

course = Course.create(
  title: "Computer Science 235",
  user: admin_user
)
puts "Course with id: #{course.id} has been created"

course = Course.create(
  title: "Creative Arts 297",
  user: admin_user
)
puts "Course with id: #{course.id} has been created"

course = Course.create(
  title: "Applied Science (Psychology) 543",
  user: admin_user
)
puts "Course with id: #{course.id} has been created"
