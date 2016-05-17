breeds = ["persian", "spannial", "doxin", "mane-coon", "siamese", "golden retriever"]
species = ["dog", "cat", "giraffe", "crocodile", "alligator", "hamster", "lynx"]
animal_images = ["http://r.ddmcdn.com/w_830/s_f/o_1/cx_98/cy_0/cw_640/ch_360/APL/uploads/2015/07/cecil-AP463227356214-1000x400.jpg",
"http://yourshot.nationalgeographic.com/u/fQYSUbVfts-T7pS2VP2wnKyN8wxywmXtY0-FwsgxoQUUu64xTHoh4QtE4gfZ1c2E7eHDcd_DPzchhzA96lON/",
"http://weknowyourdreamz.com/images/animals/animals-03.jpg", "http://science-all.com/images/animals/animals-08.jpg",
"http://ecowatch.com/wp-content/uploads/2015/01/Tiger.jpg"]
post_images = [
  "http://s5.favim.com/orig/53/dog-funny-pets-puppy-Favim.com-495423.jpg",
  "http://superfunnypets.com/wp-content/uploads/2009/10/Stay-Cool1.jpg",
  "http://www.allpetsjournal.com/wp-content/uploads/2015/08/funny-pets-1-foolgags.jpg",
  "https://s-media-cache-ak0.pinimg.com/736x/a4/4c/e4/a44ce46fedce08aeb00203fd1cffa74c.jpg",
  "http://www.animalpictures1.com/data/media/139/funny_crocodile_3.jpg"
]


20.times do
  User.create!(username: Faker::Internet.user_name, password: "1234", first_name: Faker::Name.first_name, last_name: Faker::Name.last_name)
end

User.all.each do |user|
  user.pets.create!(name: Faker::Name.name, breed: breeds.sample, animal: species.sample, age: rand(1..20))
  user.posts.create!(title: "#{user.pets.first.name} is #{Faker::Hacker.ingverb}", description: Faker::Hipster.sentence(2), body: Faker::Hipster.paragraph(10))
  user.comments.create!(post_id: rand(1..Post.all.size), body: Faker::StarWars.quote)
  user.images.create!(name: Faker::Avatar.image)
end

Pet.all.each do |pet|
  pet.images.create!(name: animal_images.sample)
end

Post.all.each do |post|
  post.images.create!(name: post_images.sample)
end


