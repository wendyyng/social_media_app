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


AttendingEvent.destroy_all
Invitation.destroy_all
Like.destroy_all
Post.destroy_all
Membership.destroy_all
Event.destroy_all
Comment.destroy_all
GroupPost.destroy_all
Group.destroy_all
User.destroy_all

#USERS

PASSWORD = "123"
super_user = User.create(
  first_name: "Admin",
  last_name: "User",
  email: "admin@user.com",
  password: PASSWORD,
  is_admin: true,
  profile_img_url: 'https://images.pexels.com/photos/9180717/pexels-photo-9180717.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2'
)

FEMALE_USER_IMAGES = [
  'https://images.pexels.com/photos/5009494/pexels-photo-5009494.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2', #1
  'https://images.pexels.com/photos/1526814/pexels-photo-1526814.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2', #2
  'https://images.pexels.com/photos/4609046/pexels-photo-4609046.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2', #3
  'https://images.pexels.com/photos/3750717/pexels-photo-3750717.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2', #4
  'https://images.pexels.com/photos/2613458/pexels-photo-2613458.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2', #5
  'https://images.pexels.com/photos/1105353/pexels-photo-1105353.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2', #6
  'https://images.pexels.com/photos/1937434/pexels-photo-1937434.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2', #7
  'https://images.pexels.com/photos/3435323/pexels-photo-3435323.jpeg', #8
  'https://images.pexels.com/photos/1820559/pexels-photo-1820559.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2', #9
  'https://images.pexels.com/photos/2905827/pexels-photo-2905827.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2', #10
  'https://images.pexels.com/photos/3328072/pexels-photo-3328072.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2', #11
  'https://images.pexels.com/photos/2228159/pexels-photo-2228159.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2', #12
  'https://images.pexels.com/photos/1447885/pexels-photo-1447885.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2', #13
  'https://images.pexels.com/photos/1520760/pexels-photo-1520760.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2', #14
  'https://images.pexels.com/photos/2748242/pexels-photo-2748242.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2', #15
  'https://images.pexels.com/photos/2748239/pexels-photo-2748239.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2', #16
  'https://images.pexels.com/photos/1003979/pexels-photo-1003979.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2', #17
  'https://images.pexels.com/photos/899954/pexels-photo-899954.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2', #18
  'https://images.pexels.com/photos/3054533/pexels-photo-3054533.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2', #19
  'https://images.pexels.com/photos/2382276/pexels-photo-2382276.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2', #20
]

MALE_USER_IMAGES = [
  'https://images.pexels.com/photos/1220757/pexels-photo-1220757.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2', #1
  'https://images.pexels.com/photos/2269872/pexels-photo-2269872.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2', #2
  'https://images.pexels.com/photos/2080736/pexels-photo-2080736.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2', #3
  'https://images.pexels.com/photos/1270076/pexels-photo-1270076.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2', #4
  'https://images.pexels.com/photos/804009/pexels-photo-804009.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2', #5
  'https://images.pexels.com/photos/2765557/pexels-photo-2765557.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2', #6
  'https://images.pexels.com/photos/2599510/pexels-photo-2599510.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2', #7
  'https://images.pexels.com/photos/4129015/pexels-photo-4129015.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2', #8
  'https://images.pexels.com/photos/673021/pexels-photo-673021.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2', #9
  'https://images.pexels.com/photos/1812634/pexels-photo-1812634.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2', #10
  'https://images.pexels.com/photos/428328/pexels-photo-428328.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2', #11
  'https://images.pexels.com/photos/2099225/pexels-photo-2099225.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2', #12
  'https://images.pexels.com/photos/3653611/pexels-photo-3653611.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2', #13
  'https://images.pexels.com/photos/2905828/pexels-photo-2905828.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2', #14
  'https://images.pexels.com/photos/2531552/pexels-photo-2531552.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2', #15
  'https://images.pexels.com/photos/3190334/pexels-photo-3190334.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2', #16
  'https://images.pexels.com/photos/1546912/pexels-photo-1546912.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2', #17
  'https://images.pexels.com/photos/2364593/pexels-photo-2364593.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2', #18
  'https://images.pexels.com/photos/4012427/pexels-photo-4012427.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2', #19
  'https://images.pexels.com/photos/2331536/pexels-photo-2331536.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2', #20

]

20.times do |n|
    first_name = Faker::Name.female_first_name
    last_name = Faker::Name.last_name
    u = User.create(
      first_name: first_name,
      last_name: last_name,
      email: "#{first_name}@#{last_name}.com",
      password: PASSWORD,
      profile_img_url: FEMALE_USER_IMAGES[n],
      address: Faker::Address.city
    )

    if u.valid?
      rand(1..5).times do
        Post.create(
          title: Faker::Hipster.sentence,
          description: Faker::Hipster.sentence,
          user: u
        )
      end
     end
end

20.times do |n|
    first_name = Faker::Name.male_first_name
    last_name = Faker::Name.last_name
    u = User.create(
      first_name: first_name,
      last_name: last_name,
      email: "#{first_name}@#{last_name}.com",
      password: PASSWORD,
      profile_img_url: MALE_USER_IMAGES[n],
      address: Faker::Address.city
     )

      rand(1..5).times do
        Post.create(
          title: Faker::Hipster.sentence,
          description: Faker::Hipster.sentence,
          user: u
        )
     end
end
  
users = User.all
posts = Post.all


#GROUPS, GROUP POSTS & COMMENTS, MEMBERSHPIS

GROUP_NAMES = [
  'The Happy Hikers', #1
  'Mandarin Chinese Club', #2
  'Japan Lover', #3
  '🐇 East Van Bunnies', #4
  'We love Astronomy Group', #5
  'Vegetable Garden Group', #6
  'Airbnb Hosts', #7
  'We love pikachu', #8
  'Joey & Friends - Sea Otter Fans & Wrigglers', #9
  'subtle asian pets', #10
  'Fun Getaways', #11
  'World Wanderlust Bucket List', #12
  'Happy cats', #13
  'Learning How To Learn', #14
  'Sayonara Sales', #15
  'Aurora Chasers', #16
  'Korean Language and Culture', #17
  'Keto for Beginners', #18
  'Women in Business', #19
  'Public Library Tech Meetup', #20
  'The Kindness Club', #20
  'CodeCore Web Development Bootcamp', #21
  'Japanese Study Group' #22
]

GROUP_IMAGES = [
  'https://images.pexels.com/photos/1365425/pexels-photo-1365425.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2', #1
  'https://images.pexels.com/photos/1167160/pexels-photo-1167160.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2', #2
  'https://images.pexels.com/photos/402028/pexels-photo-402028.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2', #3
  'https://images.pexels.com/photos/33152/european-rabbits-bunnies-grass-wildlife.jpg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2', #4
  'https://images.pexels.com/photos/2034892/pexels-photo-2034892.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2', #5
  'https://images.pexels.com/photos/7728082/pexels-photo-7728082.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2', #6
  'https://images.pexels.com/photos/1428348/pexels-photo-1428348.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2', #7
  'https://images.pexels.com/photos/1049622/pexels-photo-1049622.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2', #8
  'https://images.pexels.com/photos/185032/pexels-photo-185032.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2', #9
  'https://images.pexels.com/photos/1108099/pexels-photo-1108099.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2', #10
  'https://images.pexels.com/photos/1205700/pexels-photo-1205700.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2', #11
  'https://images.pexels.com/photos/2325446/pexels-photo-2325446.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2', #12
  'https://images.pexels.com/photos/416160/pexels-photo-416160.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2', #13
  'https://images.pexels.com/photos/4778622/pexels-photo-4778622.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2', #14
  'https://images.pexels.com/photos/845599/pexels-photo-845599.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2', #15
  'https://images.pexels.com/photos/360912/pexels-photo-360912.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2', #16
  'https://images.pexels.com/photos/2354072/pexels-photo-2354072.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2', #17
  'https://images.pexels.com/photos/1305063/pexels-photo-1305063.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2', #18
  'https://images.pexels.com/photos/1181533/pexels-photo-1181533.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2', #19
  'https://images.pexels.com/photos/6334074/pexels-photo-6334074.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2', #20
  'https://images.pexels.com/photos/6646974/pexels-photo-6646974.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2', #20
  'https://www.jeduka.com/storage/school_gallery/2/codecore-college-2.jpg', #21
  'https://images.pexels.com/photos/1440476/pexels-photo-1440476.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2' #22
]

22.times do |i|
    created_at = Faker::Date.backward(days: 3)

    g = Group.create(
        title: GROUP_NAMES[i],
        description: Faker::Hipster.sentence,
        user: users.sample,
        img_url: GROUP_IMAGES[i],
        address: "vancouver"
      )

    if g.valid?
      Membership.create(user:super_user, group: g)
        rand(1..5).times do
          u = users.sample
          Membership.create(user:u, group: g)
          gp = GroupPost.create(body: Faker::Hipster.sentence, user: u, group: g)
          if gp.valid?
            gp.likers = users.shuffle.slice(0, rand(users.count))
            rand(1..5).times do
                Comment.create(body: Faker::Hipster.sentence, user: users.sample, group_post: gp)
            end
          end

        end
    end
end

groups = Group.all
group_posts = GroupPost.all
comments = Comment.all
memberships = Membership.all
likes = Like.all

# EVENTS

EVENT_NAMES = [
  'Pizza workshop @Italian Culture Centre', #1
  'Open Mic Event', #2
  'Ghostly Downtown Tour', #3
  'DIY Wedding Flower Workshop', #4
  'Brazilian Day', #5
  'Outdoor Market 2022', #6
  'Yoga on Sunset beach', #7
  'Summer Treasure Hunt', #8
  'Swing Dance Night', #9
  '25 Year Reunion', #10
  'Summer Boat Party', #11
  'Drumming Together', #12
  'Heart Song Circle - Free Open House', #13
  'Guitars! Guitars! Guitars!', #14
  'Farmers market', #15
  'Tech meetup', #16
  'Live Stand Up Comedy', #17
  'Boutique Guitar Showcase', #18
  'Micd Up Tuesdays', #19
  'International Piano Festival', #20
  'Japan Market Fair', #21
]

EVENT_IMAGES = [
  'https://images.pexels.com/photos/905847/pexels-photo-905847.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2', #1
  'https://images.pexels.com/photos/8044083/pexels-photo-8044083.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2', #2
  'https://images.pexels.com/photos/316681/pexels-photo-316681.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2', #3
  'https://images.pexels.com/photos/169190/pexels-photo-169190.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2', #4
  'https://images.pexels.com/photos/1191548/pexels-photo-1191548.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2', #5
  'https://images.pexels.com/photos/1060803/pexels-photo-1060803.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2', #6
  'https://images.pexels.com/photos/317157/pexels-photo-317157.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2', #7
  'https://images.pexels.com/photos/366791/pexels-photo-366791.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2', #8
  'https://images.pexels.com/photos/6248910/pexels-photo-6248910.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2', #9
  'https://images.pexels.com/photos/5638732/pexels-photo-5638732.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2', #10
  'https://images.pexels.com/photos/5046354/pexels-photo-5046354.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2', #11
  'https://images.pexels.com/photos/173292/pexels-photo-173292.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2', #12
  'https://images.pexels.com/photos/6860495/pexels-photo-6860495.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2', #13
  'https://images.pexels.com/photos/1751731/pexels-photo-1751731.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2', #14
  'https://images.pexels.com/photos/439818/pexels-photo-439818.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2', #15
  'https://images.pexels.com/photos/3183197/pexels-photo-3183197.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2', #16
  'https://images.pexels.com/photos/713149/pexels-photo-713149.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2', #17
  'https://images.pexels.com/photos/8043939/pexels-photo-8043939.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2', #18
  'https://images.pexels.com/photos/164829/pexels-photo-164829.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2', #19
  'https://images.pexels.com/photos/2378209/pexels-photo-2378209.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2', #20
  'https://images.pexels.com/photos/5472258/pexels-photo-5472258.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2', #21
]

21.times do |i|
  u = users.sample
  e = Event.create(
      title: EVENT_NAMES[i],
      description: Faker::Hipster.sentence,
      location: Faker::Address.city,
      date: Faker::Date.forward(days: 90),
      organizer_id: u.id,
      img_url: EVENT_IMAGES[i],
    )

  if e.valid?
    e.attendees << u
      rand(1..5).times do
        AttendingEvent.create(
          user_id: users.sample.id,
          event_id: e.id
        )
      end
  end
end

events = Event.all
attending_events = AttendingEvent.all

p "created #{groups.count} groups, 
#{group_posts.count} group posts, 
#{likes.count} likes, 
#{comments.count} comments, 
#{memberships.count} memberships,
#{users.count} users,
#{posts.count} posts,
#{events.count} events,
#{attending_events.count} attending events
"

groups = Group.all
group_posts = GroupPost.all
likes = Like.all
comments = Comment.all
memberships = Membership.all
users