# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create! do |u|
        u.email     = 'admin@admin.com'
        u.password    = 'qweqwe'
        u.role = 'admin'
        u.name = 'admin'
    end

5.times do 
	user = User.create!(email: Faker::Internet.email, name: Faker::Name.name, password: 'qweqwe')
	5.times do
		image = user.images.create(title: Faker::Hipster.sentence(3)[0..20])
		image.picture = Rails.root.join("app/assets/images/1.jpg").open
		image.save!
	end
end

50.times do 
	@users = User.all
	@images = Image.all
	ImageComment.create(body: Faker::ChuckNorris.fact, rating: rand(1..5), user: @users.sample, image: @images.sample )
end