get '/adoptions' do
  logged_in?
  petfinder = Petfinder::Client.new
  @pets = Array.new
  6.times do
    pet = petfinder.random_pet
    if (pet.try(:name) &&
        pet.try(:sex) &&
        pet.breeds.join(" | ") &&
        pet.photos.last.try(:medium) &&
        pet.try(:animal) )
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

