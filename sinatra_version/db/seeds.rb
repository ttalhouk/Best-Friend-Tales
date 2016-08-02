post_images = [
  "http://s5.favim.com/orig/53/dog-funny-pets-puppy-Favim.com-495423.jpg",
  "http://superfunnypets.com/wp-content/uploads/2009/10/Stay-Cool1.jpg",
  "http://www.allpetsjournal.com/wp-content/uploads/2015/08/funny-pets-1-foolgags.jpg",
  "https://s-media-cache-ak0.pinimg.com/736x/a4/4c/e4/a44ce46fedce08aeb00203fd1cffa74c.jpg"
]


20.times do
  User.create!(
    username: Faker::Internet.user_name,
    password: "1234",
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    zip: Faker::Address.zip_code
  )
end

User.all.each do |user|
  petfinder = Petfinder::Client.new
  @user_pet = petfinder.random_pet
  user.pets.create!(
    name: @user_pet.name,
    animal: @user_pet.animal,
    mix: @user_pet.mix,
    age: @user_pet.age,
    sex: @user_pet.sex,
    description: @user_pet.description,
    breeds: @user_pet.breeds.join(" | "),
    is_pet_of_user: false,
    shelter_id: @user_pet.shelter_id
  )
  user.pets.last.images.create!(name: (@user_pet.photos.sample.try(:medium) || 'http://www.georgiaspca.org/sites/default/files/images/Paws-for-Consider-icon-v2.jpg'))
  user.posts.create!(title: "#{user.pets.last.name} is #{Faker::Hacker.ingverb}", description: Faker::Hipster.sentence(2), body: Faker::Hipster.paragraph(10))

  comment_body = Faker::StarWars.quote
  sentiment = RestClient.post("http://text-processing.com/api/sentiment/", text: comment_body)
  comment_hash = JSON.parse(sentiment)

  user.comments.create!(
    post_id: rand(1..Post.all.size),
    body: comment_body,
    pos: comment_hash["probability"]["pos"],
    neg: comment_hash["probability"]["neg"],
    neutral: comment_hash["probability"]["neutral"],
    label: comment_hash["label"]
  )
  user.images.create!(name: Faker::Avatar.image)
end

Post.all.each do |post|
  post.images.create!(name: post_images.sample)
end


