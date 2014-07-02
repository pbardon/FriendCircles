# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


User.new(email: "test1@mail.com", password: "12345678").save!
User.new(email: "test2@mail.com", password: "12345678").save!
User.new(email: "test3@mail.com", password: "12345678").save!
User.new(email: "test4@mail.com", password: "12345678").save!


Post.create(title: "post1", body: "interesting content", user_id: 1)
Post.create(title: "post2", body: "interesting content", user_id: 1)
Post.create(title: "post3", body: "interesting content", user_id: 1)
Post.create(title: "post4", body: "interesting content", user_id: 2)
Post.create(title: "post5", body: "interesting content", user_id: 3)

Circle.create(name: "circle1", user_id: 1)
Circle.create(name: "circle2", user_id: 1)
Circle.create(name: "circle3", user_id: 2)

CircleMembership.create(user_id: 2, circle_id: 1)
CircleMembership.create(user_id: 3, circle_id: 1)
CircleMembership.create(user_id: 4, circle_id: 1)
CircleMembership.create(user_id: 1, circle_id: 3)
CircleMembership.create(user_id: 1, circle_id: 3)

PostShare.create(post_id: 1, circle_id: 1)
PostShare.create(post_id: 2, circle_id: 1)
PostShare.create(post_id: 3, circle_id: 1)
PostShare.create(post_id: 5, circle_id: 3)

Link.create(title: "link1", url: "url1", post_id: 1)
