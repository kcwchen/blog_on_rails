# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Post.destroy_all

until Post.all.count == 50
  Post.create(
    title: Faker::Book.title,
    body: Faker::Lorem.paragraph * rand(5..10)
  )
end

posts = Post.all.count
puts posts