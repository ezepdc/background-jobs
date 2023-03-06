puts "Cleaning database..."

User.destroy_all
Student.destroy_all
Course.destroy_all
Enrollment.destroy_all

puts "Creating..."

admin_user = User.create(
  email: "admin.user@not_mail.com",
  password: "123456",
  admin: true
)
puts "Admin user with id: #{admin_user.id} has been created"
