# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
#
#
# Create user
puts 'Creating user...'
email = 'user@test.pe'
user = User.find_by_email(email) || User.create!(name: Faker::Name.name, email: email, password: '123456')
puts "User created: #{user.email}"

# Create categories
puts 'Creating categories...'
5.times do
  category = FactoryBot.create(:category, user:)
  puts "Category created: #{category.name}"
end
puts 'Categories created'

# Create payment methods
puts 'Creating payment methods...'
5.times do
  payment_method = FactoryBot.create(:payment_method, user:)
  puts "Payment method created: #{payment_method.name}"
end
puts 'Payment methods created'

# Create expenses
puts 'Creating expenses...'
20.times do
  expense = FactoryBot.create(:expense, user:, category: Category.all.sample, payment_method: PaymentMethod.all.sample)
  puts "Expense created: #{expense.description}"
end
puts 'Expenses created'
