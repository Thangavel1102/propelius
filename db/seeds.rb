# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



roles = [:inventory_manager, :quality_check_person, :sales_manager, :it_admin]

roles.each do |role|
  User.create!(email: "#{role}@gmail.com" , password: 'rails@123' , password_confirmation: 'rails@123', first_name: "Anand_#{role}", last_name: "B_#{role}", role: "#{role}")
end

Inventory.create(name: "Item 1", description: "First Item", price: 10, qa_status: "accepted")
