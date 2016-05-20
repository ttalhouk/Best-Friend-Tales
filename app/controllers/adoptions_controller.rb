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
  @pets = Array.new
  dog = petfinder.find_pets('dog', current_user.zip).sample(5)
  cat = petfinder.find_pets('cat', current_user.zip).sample(5)
  @pets = check_data(dog).concat(check_data(cat))
  @pets = @pets.uniq
  if request.xhr?
    return erb :'adoptions/_index', layout: false, locals: {pets: @pets}
  else
    erb :'adoptions/index'
  end
end
