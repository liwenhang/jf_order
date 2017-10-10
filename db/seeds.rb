# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

admin = User.new(
  email: "hyekyoz@outlook.com",
  password: "password123"
)
admin.skip_confirmation!
admin.save
admin.add_role :admin

merchant = User.new(
  email: "799654910@qq.com",
  password: "password123"
)
merchant.skip_confirmation!
merchant.save
merchant.add_role :merchant



30.times do |index|
  user = User.new(
    email: "#{Faker::Name.unique.first_name}@jforder.com",
    password: "password123"
  )
  user.skip_confirmation!
  user.save
  user.add_role :merchant
  user.stores.create! name: Faker::Company.name, intro: Faker::Address.street_address
end
