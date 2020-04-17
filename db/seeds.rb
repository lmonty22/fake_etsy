require 'open-uri'

User.destroy_all
Shop.destroy_all
Item.destroy_all
Order.destroy_all
OrderItem.destroy_all
Review.destroy_all

100.times {
            downloaded_image = open("https://loremflickr.com/320/240/person")
            user = User.new(username: Faker::Twitter.screen_name, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, password: "password")
            user.image.attach(io: downloaded_image, filename: "#{rand(1..1000)}.jpg")
            user.save
          }

100.times {
            downloaded_image = open(Faker::Company.logo)
            shop = Shop.new(user: User.all.sample, name: Faker::Book.title, description: Faker::Hipster.paragraph)
            shop.image.attach(io: downloaded_image, filename: "#{rand(1001..2000)}.jpg")
            shop.save
          }

1000.times {
            downloaded_image = open("https://loremflickr.com/320/240/object")
            item = Item.new(shop: Shop.all.sample, name: Faker::Commerce.product_name, price: Faker::Commerce.price, quantity: rand(1..100), listed: Faker::Boolean.boolean, description: Faker::Hipster.paragraph)
            item.image.attach(io: downloaded_image, filename: "#{rand(2001..3000)}.jpg")
            item.save
           }

1000.times {
            order = Order.create(user: User.all.sample)
            OrderItem.create(item: Item.all.sample, order: order)
           }
    
1000.times {
            order = Order.create(user: User.all.sample)
            OrderItem.create(item: Item.all.sample, order: order)
            OrderItem.create(item: Item.all.sample, order: order)
           }

1000.times {
    user = User.all.sample
    item = user.items.sample
    Review.create(user: user, item: item, title: Faker::Job.title, content: Faker::Hipster.sentence, rating: rand(1..5))
    }

user1 = User.create(username: "lmonty22", first_name: "Lindsay", last_name: "Montgomery", password: "password")
user2 = User.create(username: "bret-gib", first_name: "Bret", last_name: "Gibson", password: "password")
user1.image.attach(io: File.open('app/assets/images/headshot4.png'), filename: 'headshot4.png')
user2.image.attach(io: File.open('app/assets/images/50393443.jpg'), filename: '50393443.jpg')


downloaded_image = open(Faker::Company.logo)
shop1 = Shop.new(user_id: user1.id, name: "Lindsay's shop ", description: "Things I could never make.")
shop1.image.attach(io: downloaded_image, filename: "sample.jpg")
shop1.save

item1 = Item.create(name: "Face Mask", shop_id: shop1.id, price: 10.00, quantity: 2, description: "Protects against COVID-19 spread.")
item1.image.attach(io: File.open('app/assets/images/face_mask.jpg'), filename: 'face_mask.jpg')
item2 = Item.create(name: "Dog bandana", shop_id: shop1.id, price: 25.00, quantity: 2, description: "Makes your dog look cool.")
item1.image.attach(io: File.open('app/assets/images/dog_bandana.webp'), filename: 'dog_bandana.webp')
order1 = Order.create(user_id: user2.id )
oi1 = OrderItem.create(order_id: order1.id, item_id: item1.id)
oi2 = OrderItem.create(order_id:order1.id, item_id: item2.id)
review1 = Review.create(user_id: user2.id, item_id: item1.id, rating: 5)