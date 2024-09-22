# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

mark = User.create!(email: 'mark@sample.com', password: 'password')
emily = User.create!(email: 'emily@sample.com', password: 'password')
# .create!で絶対に保存される（何かあったら絶対エラーが出る）

2.times do
  mark.boards.create!(
    title: Faker::Lorem.sentence(word_count: 5),
    content: Faker::Lorem.sentence(word_count: 20)
  )
end

2.times do
  emily.boards.create!(
    title: Faker::Lorem.sentence(word_count: 5),
    content: Faker::Lorem.sentence(word_count: 20)
  )
end