# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


Rails.application.eager_load!
ActiveRecord::Base.connection.disable_referential_integrity do
  ApplicationRecord.descendants.each do |model|
    model.delete_all
  end
end


Comment.destroy_all
GroupPost.destroy_all
Group.destroy_all
User.destroy_all

PASSWORD = "123"
super_user = User.create(
  first_name: "Admin",
  last_name: "User",
  email: "admin@user.com",
  password: PASSWORD,
  is_admin: true
)

10.times do 
    first_name = Faker::Name.first_name
    last_name = Faker::Name.last_name
    User.create(
      first_name: first_name,
      last_name: last_name,
      email: "#{first_name}@#{last_name}.com",
      password: PASSWORD,
    )
end
  
users = User.all

10.times do |i|
    created_at = Faker::Date.backward(days: 5)

    g = Group.create(
        title: Faker::Commerce.product_name,
        description: Faker::Hipster.sentence,
        created_at: created_at,
        updated_at: created_at,
        user: super_user
      )

    if g.valid?
      Membership.new(user:super_user, group: g)
        rand(1..3).times do
          Membership.new(user:users.sample, group: g)
          gp = GroupPost.create(body: Faker::Hipster.sentence, user: users.sample, group: g)
          if gp.valid?
            rand(1..3).times do
                Comment.create(body: Faker::Hipster.sentence, user: users.sample, group_post: gp)
            end
          end

        end
    end
end

groups = Group.all
group_posts = GroupPost.all
comments = Comment.all

p "created #{groups.count} groups, #{group_posts.count} group posts, #{comments.count} comments, #{users.count} users"


