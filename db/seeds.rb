# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Comment.destroy_all
Post.destroy_all

until Post.all.count == 50
  created_at = Faker::Date.backward(days:365 * 2)

  p = Post.create(
    title: Faker::Book.title,
    body: Faker::Lorem.paragraph * rand(5..10),
    created_at: created_at,
    updated_at: created_at
  )

  if p.valid?
    rand(1..5).times do
      Comment.create(
        body: Faker::Lorem.paragraph,
        post: p
      )
    end
  end
end

posts = Post.all
comments = Comment.all
puts posts.count
puts comments.count