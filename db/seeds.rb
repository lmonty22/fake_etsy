User.destroy_all
Shop.destroy_all
Item.destroy_all
Order.destroy_all
OrderItem.destroy_all
Review.destroy_all

100.times {User.create(username: Faker::Games::Dota.hero, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, password: "password")}
# 10.times {Shop.create(user: User.order('RANDOM()').first, name: Faker::Games::Pokemon.name, description: Faker::Games::Pokemon.move)}
100.times {Shop.create(user: User.all.sample, name: Faker::Company.name , description: Faker::Hipster.paragraph)}
100.times {Item.create(shop: Shop.all.sample, name: Faker::Commerce.product_name, price: Faker::Commerce.price, quantity: rand(1..100), listed: Faker::Boolean.boolean, description: Faker::Hipster.paragraph)}
100.times {
    order = Order.create(user: User.all.sample)
    OrderItem.create(item: Item.all.sample, order: order)
    }
    
100.times {
        order = Order.create(user: User.all.sample)
        OrderItem.create(item: Item.all.sample, order: order)
        OrderItem.create(item: Item.all.sample, order: order)
        }

# image: Faker::Company.logo
# image: Faker::Avatar.image
# image: Faker::Placeholdit.image

user1 = User.create(username: "lmonty22", first_name: "Lindsay", last_name: "Montgomery", password: "password")
user2 = User.create(username: "bret-gib", first_name: "Bret", last_name: "Gibson", password: "password")
user1.image.attach(io: File.open('app/assets/images/headshot4.png'), filename: 'headshot4.png')
user2.image.attach(io: File.open('app/assets/images/50393443.jpg'), filename: '50393443.jpg')

shop1 = Shop.create(user_id: user1.id, name: "Lindsay's shop ", description: "Things I could never make. ")
shop1.image.attach(io: File.open('app/assets/images/shop.png'), filename: 'shop.png')

item1 = Item.create(name: "Face Mask", shop_id: shop1.id, price: 10.00, quantity: 30, description: "Protects against COVID-19 spread.")
item2 = Item.create(name: "Dog bandana", shop_id: shop1.id, price: 25.00, quantity: 10, description: "Makes your dog look cool.")
order1 = Order.create(user_id: user2.id )
oi1 = OrderItem.create(order_id: order1.id, item_id: item1.id)
oi2 = OrderItem.create(order_id:order1.id, item_id: item2.id)
review1 = Review.create(user_id: user2.id, item_id: item1.id, rating: 5)