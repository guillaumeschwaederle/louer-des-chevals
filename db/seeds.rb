# db/seeds.rb
require 'faker'
Booking.destroy_all
Review.destroy_all
Cheval.destroy_all
Robe.destroy_all
Category.destroy_all
Profile.destroy_all
User.destroy_all

robes = ["alezane", "bai", "café au lait", "isabelle", "souris", "noire", "crème",  "chocolat", "blanc", "grise", "Dun", "champagne", "silver", "perle", "louvet", "rouanne", "pie"]
categories = ["cheval de trait", "cheval de selle", "cheval sauvage" "poney", "cheval de sport", "cheval de course"]

robes.each do |robe|
    Robe.create!(name: robe)
end

categories.each do |category|
    Category.create!(name: category)
end

user = User.create!(
    email: "user@gmail.com",
    password: "123456"  
)

profile = Profile.new(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    user: user
)
profile.save!

photo_cheval_list = [
        "https://images.unsplash.com/photo-1460999158988-6f0380f81f4d?auto=format&fit=crop&w=1200&q=50&ixid=dW5zcGxhc2guY29tOzs7Ozs%3D",
        "https://images.unsplash.com/photo-1450052590821-8bf91254a353?auto=format&fit=crop&w=1200&q=50&ixid=dW5zcGxhc2guY29tOzs7Ozs%3D",
        "https://images.unsplash.com/photo-1485201567137-7771be2f710c?auto=format&fit=crop&w=1200&q=50&ixid=dW5zcGxhc2guY29tOzs7Ozs%3D",
        "https://images.unsplash.com/photo-1449870107643-256a999b3527?auto=format&fit=crop&w=1200&q=50&ixid=dW5zcGxhc2guY29tOzs7Ozs%3D",
        "https://images.unsplash.com/photo-1508343919546-4a5792fee935?auto=format&fit=crop&w=1200&q=50&ixid=dW5zcGxhc2guY29tOzs7Ozs%3D",
        "https://images.unsplash.com/photo-1430825803925-53e62bb14db1?auto=format&fit=crop&w=1200&q=50&ixid=dW5zcGxhc2guY29tOzs7Ozs%3D",
        "https://images.unsplash.com/photo-1497781495506-ce58b286d8f5?auto=format&fit=crop&w=1200&q=50&ixid=dW5zcGxhc2guY29tOzs7Ozs%3D",
        "https://images.unsplash.com/photo-1495399767202-dd45059d9169?auto=format&fit=crop&w=1200&q=50&ixid=dW5zcGxhc2guY29tOzs7Ozs%3D",
        "https://images.unsplash.com/photo-1506030997937-bfc0a17ccdd6?auto=format&fit=crop&w=1200&q=50&ixid=dW5zcGxhc2guY29tOzs7Ozs%3D",
        "https://images.unsplash.com/photo-1465352320358-78e22b587ac6?auto=format&fit=crop&w=1200&q=50&ixid=dW5zcGxhc2guY29tOzs7Ozs%3D",
        "https://images.unsplash.com/photo-1504021037272-d8413c3411db?auto=format&fit=crop&w=1200&q=50&ixid=dW5zcGxhc2guY29tOzs7Ozs%3D",
        "https://images.unsplash.com/photo-1505246170520-1c003eda7abb?auto=format&fit=crop&w=1200&q=50&ixid=dW5zcGxhc2guY29tOzs7Ozs%3D",
        "https://images.unsplash.com/photo-1493436648024-1790604db7fd?auto=format&fit=crop&w=1200&q=50&ixid=dW5zcGxhc2guY29tOzs7Ozs%3D",
        "https://images.unsplash.com/photo-1466154714956-9f5f64682fcc?auto=format&fit=crop&w=1200&q=50&ixid=dW5zcGxhc2guY29tOzs7Ozs%3D",
        "https://images.unsplash.com/photo-1481572372297-7e7d0338035f?auto=format&fit=crop&w=1200&q=50&ixid=dW5zcGxhc2guY29tOzs7Ozs%3D",
        "https://images.unsplash.com/photo-1485874717621-4e87c6ac87ef?auto=format&fit=crop&w=1200&q=50&ixid=dW5zcGxhc2guY29tOzs7Ozs%3D",
        "https://images.unsplash.com/photo-1460396380617-a1fdc2ffa5c4?auto=format&fit=crop&w=1200&q=50&ixid=dW5zcGxhc2guY29tOzs7Ozs%3D",
        "https://images.unsplash.com/photo-1460396380617-a1fdc2ffa5c4?auto=format&fit=crop&w=1200&q=50&ixid=dW5zcGxhc2guY29tOzs7Ozs%3D",
        "https://images.unsplash.com/photo-1499404970935-f072c1086c9c?auto=format&fit=crop&w=1200&q=50&ixid=dW5zcGxhc2guY29tOzs7Ozs%3D",
        "https://images.unsplash.com/photo-1458431886725-0801460469c5?auto=format&fit=crop&w=1200&q=50&ixid=dW5zcGxhc2guY29tOzs7Ozs%3D",
        "https://images.unsplash.com/photo-1497138169556-ba5743a6031c?auto=format&fit=crop&w=1200&q=50&ixid=dW5zcGxhc2guY29tOzs7Ozs%3D",
        
    ]

10.times do
    cheval = Cheval.create!(
    name: Faker::DragonBall.character,
    description: Faker::Lorem.paragraph,
    pattes: (1..5).to_a.sample,
    taille: Faker::Number.number(3),
    price: Faker::Number.number(2),
    robe: Robe.all.sample,
    category: Category.all.sample,
    ville: ["Paris", "Lille", "Marseille", "Amiens", "Arras", "Lyon", "Bordeaux"].sample,
    rue: "30 Rue de Paris",
    profile: profile
    )
    
    cheval.remote_photo_url = photo_cheval_list.sample
    cheval.save
    puts "cheval created"
end

n = 1
users = []
10.times do
    u = User.create!(
        email: "user#{n}@gmail.com",
        password: "123456"
    )
    users << u
    p = Profile.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    user: u
    )
    n += 1
end

(5..25).to_a.sample.times do
    p = users.sample.profile
    c = Cheval.all.sample
    b = Booking.create!(
        start_date: Faker::Date.between(14.days.ago, 7.days.ago),
        end_date: Faker::Date.between(6.days.ago, 1.days.ago),
        statut: "Pending",
        message: Faker::Seinfeld.quote,
        profile: p,
        cheval: c
    )
    r = Review.create!(
        content: "bla " * (5..10).to_a.sample,
        rating: (1..5).to_a.sample,
        profile: p,
        cheval: c
    )
end



