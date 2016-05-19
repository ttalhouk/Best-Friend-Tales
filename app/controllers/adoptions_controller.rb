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

get '/adoptions/zip' do
  logged_in?
  petfinder = Petfinder::Client.new

  pet_data = [["dog", 7], ["cat", 7], ["bird", 3], ["reptile", 1], ["smallfurry", 2]].map do |animal|
    petfinder.find_pets(animal[0], current_user.zip).sample(animal[1])
  end

  @pets = check_data(pet_data.flatten!)
  @pets = @pets.uniq.shuffle
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

