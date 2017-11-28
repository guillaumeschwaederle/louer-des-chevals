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

10.times do
    cheval = Cheval.create!(
    name: Faker::DragonBall.character,
    description: Faker::Lorem.paragraph,
    address: Faker::Name.name,
    pattes: (1..5).to_a.sample,
    taille: Faker::Number.number(3),
    price: Faker::Number.number(2),
    robe: Robe.all.sample,
    category: Category.all.sample,
    profile: profile
    )
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



