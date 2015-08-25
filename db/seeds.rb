require 'faker'

10.times do
  Category.create(name: Faker::Lorem.word)
end

Category.all.each do |category|
  10.times do
    Post.create(title: Faker::Lorem.word,
                 description: Faker::Lorem.sentence,
                 email: Faker::Internet.email,
                 price: rand(1001),
                 key: Faker::Internet.password(8),
                 category_id: category.id)
  end
end