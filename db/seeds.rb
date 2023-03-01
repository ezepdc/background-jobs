puts "Cleaning database..."

User.destroy_all
Course.destroy_all
Enrollment.destroy_all

puts "Creating..."

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
