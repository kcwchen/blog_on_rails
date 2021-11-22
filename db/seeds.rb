# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Comment.destroy_all
Post.destroy_all

PASSWORD = "123"

super_user = User.create(
  first_name: "Admin",
  last_name: "User",
  email: "admin@user.com",
  password: PASSWORD,
  is_admin: true
)

5.times do
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  User.create(
    first_name: first_name,
    last_name: last_name,
    email: "#{first_name.downcase}@#{last_name.downcase}.com",
    password: PASSWORD
  )
end

users = User.all

until Post.all.count == 50
  created_at = Faker::Date.backward(days:365 * 2)

  p = Post.create(
    title: Faker::Book.title,
    body: Faker::Lorem.paragraph * rand(5..10),
    created_at: created_at,
    updated_at: created_at,
    user: users.sample
  )

  if p.valid?
    rand(1..5).times do
      Comment.create(
        body: Faker::Lorem.paragraph,
        post: p,
        user: users.sample
      )
    end
  end
end

posts = Post.all
comments = Comment.all
puts users.count
puts posts.count
puts comments.count