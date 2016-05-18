get '/adoptions' do
  petfinder = Petfinder::Client.new
  @pets = Array.new
  6.times do
    @pets << petfinder.random_pet
  end
  @pets = @pets.uniq

  erb :'adoptions/index'
end

# Find pet's photo:
# petfinder.random_pet.photos.sample.medium

# Find pet's shelter:
# petfinder.shelter(petfinder.random_pet.shelter_id)

