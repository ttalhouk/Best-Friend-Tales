get '/adoptions' do
  petfinder = Petfinder::Client.new
  @pets = Array.new
  5.times do
    @pets << petfinder.random_pet
  end
  @pets = @pets.uniq
  p @pets
  erb :'adoptions/index'
end
