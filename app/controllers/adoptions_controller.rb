get '/adoptions' do
  petfinder = Petfinder::Client.new
  @pets = Array.new
  6.times do
    pet = petfinder.random_pet
    if (pet.name &&
        pet.sex &&
        pet.breeds.join(" | ") &&
        pet.photos.sample.medium &&
        pet.animal )
      @pets << pet
    end
  end
  @pets = @pets.uniq
  if request.xhr?
    return erb :'adoptions/_index', layout: false, locals: {pets: @pets}
  else
    erb :'adoptions/index'
  end
end

# Find pet's photo:
# petfinder.random_pet.photos.sample.medium

# Find pet's shelter:
# petfinder.shelter(petfinder.random_pet.shelter_id)

