# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# Planet.destroy_all

# 20.times {Planet.create(name: Faker::TvShows::StarTrek.unique.location,
#                         distance_from_earth: Faker::Space.unique.distance_measurement,
#                         nearest_star: Faker::Space.star)}

# 15.times {Scientist.create(name: Faker::FunnyName.name,
#                            field_of_study: Faker::Educator.subject)}

# 20.times {Mission.create(name: Faker::TvShows::Buffy.unique.episode,
#                          scientist: Scientist.all.sample, 
#                          planet: Planet.all.sample)}
User.destroy_all
Shop.destroy_all
Item.destroy_all
Order.destroy_all
OrderItem.destroy_all
Review.destroy_all

user1 = User.create(username: "lmonty22", first_name: "Lindsay", last_name: "Montgomery", password: "password")
user2 = User.create(username: "bret-gib", first_name: "Bret", last_name: "Gibson", password: "password")
shop1 = Shop.create(user_id: user1.id, name: "Things I could never make")
item1 = Item.create(name: "Face Mask", shop_id: shop1.id)
item2 = Item.create(name: "Dog bandana", shop_id: shop1.id)
order1 = Order.create(user_id: user2.id )
oi1 = OrderItem.create(order_id: order1.id, item_id: item1.id)
oi2 = OrderItem.create(order_id:order1.id, item_id: item2.id)
review1 = Review.create(user_id: user2.id, item_id: item1.id, rating: 5)