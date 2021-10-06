# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Tagging.delete_all
Post.delete_all
Category.delete_all
Tag.delete_all
User.delete_all

Category.create(name: "Programming")
Category.create(name: "Web development")
Category.create(name: "Ruby on Rails")
Category.create(name: "React")

javascript = Tag.create(name: "Javascript")
react = Tag.create(name: "React")
ruby = Tag.create(name: "Ruby")
node = Tag.create(name: "Node")


admin_user = User.create(
    email: "suyash@gmail.com",
    username: "suyashk", password: "suyash",
    password_confirmation: "suyash"
)

10.times do |i|
    User.create(
        email: "Faker::Internet.email",
        username: "Faker::Name.name",
        password: "123456",
        password_confirmation: "123456"
    )
end



Category.all.each do |category|
    10.times do |i|
        Post.create(
            title: "Post #{i}",description: "Post #{i} Details",
            tags: i % 2 == 0 ? [javascript, react] : [node, ruby],
            category: category
        )
    end
end