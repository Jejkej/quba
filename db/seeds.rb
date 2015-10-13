environment_seed_file = File.join(Rails.root, 'db', 'seeds', "#{Rails.env}.rb")

def seed_image(file_name)
  File.open(File.join(Rails.root, "/app/assets/images/seed/#{file_name}.jpg"))
end

User.create!(name:	"Example User",
						 email:	"example@quba.com",
						 password:							"foobar",
						 password_confirmation:	"foobar",
						 admin: true )

99.times do |n|
	name = Faker::Name.name
	email = "example-#{n+1}@quba.com"
	password = "password"
	User.create!(name:	name,
							 email: email,
							 password:							password,
							 password_confirmation:	password )
end

users = User.order(:created_at).take(6)
50.times do
  title = "HUEHUEHUEHUE"
	avatar = seed_image('test')
  users.each { |user| user.posts.create!(title: title, avatar: avatar) }
end
