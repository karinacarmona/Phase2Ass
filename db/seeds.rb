10.times do
  User.create(name: Faker::Name.name,
  email: Faker::Internet.email,
  password: "password",
  picture_url: Faker::Internet.url
  )

end


20.times do
  Post.create(title: Faker::Hacker.say_something_smart,
  content: Faker::Lorem.paragraph,
  user_id: rand(1..10))

end


30.times do
  Tag.create(name: Faker::Lorem.word)

end


40.times do
  PostTag.create(post_id: rand(1..20),
  tag_id: rand(1..30))

end

30.times do
  Resource.create(title: Faker::Hacker.say_something_smart,
  resource_url: 'http://www.theweek.com',
  post_id: rand(20))
end
