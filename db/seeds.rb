# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

john = User.create!(email: 'john@sample.com', password: 'password')
emily = User.create!(email: 'emily@sample.com', password: 'password')
# .create!で絶対に保存される（何かあったら絶対エラーが出る）

3.times do
  john.boards.create!(
    title: Faker::Lorem.sentence(word_count: 5),
    content: Faker::Lorem.sentence(word_count: 100)
  )
end

# 5.times do
# # 5回繰り返す
#   emily.articles.create!(
#     title: Faker::Lorem.sentence(word_count: 5),
#     content: Faker::Lorem.sentence(word_count: 100)
#   )
# end