# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Admin.create!(
#     email: 'test@test.com',
#     password: 'testtest',
# )

# admins = [
#   {email: 'test@test.com', password: 'testtest'},
# ]

# admins.each do |admin|
#   # 一度ユーザーをメールアドレスで検索
#   admin_data = Admin.find_by(email: admin[:email])
#   # 該当ユーザーがいなければ、createする
#   if admin_data.nil?
#     Admin.create(
#       email: admin[:email],
#       password: admin[:password]
#     )
#   end
# end

# users = [
#   {name: '', email: 'user1@example.com', password: 'passw@rd'},
#   {name: '', email: 'user2@example.com', password: 'passw@rd'},
#   {name: '', email: 'user3@example.com', password: 'passw@rd'},
#   {name: '', email: 'user4@example.com', password: 'passw@rd'},
#   {name: '', email: 'user5@example.com', password: 'passw@rd'},
# ]

# users.each do |user|
#   # 一度ユーザーをメールアドレスで検索
#   user_data = User.find_by(email: user[:email])
#   # 該当ユーザーがいなければ、createする
#   if user_data.nil?
#     User.create(
#         name: user[:name],
#         email: user[:email],
#         password: user[:password]
#     )
#   end
# end

# genres = ['絵本', 'ぬいぐるみ','幼児向け', '1~2才', '3~4才', '5才~6才', '7才~11才', '12才~']
# genres.each do |genre|
#   Genre.find_or_create_by(name: genre)
# end