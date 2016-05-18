# User Pets index action
get '/users/:user_id/pets' do
  logged_in?
  @user = User.find(params[:user_id])
  @pets = @user.pets.all
  erb :'pets/index'
end

# Pets new action
get '/users/:user_id/pets/new' do
  logged_in?
  @user = User.find(params[:user_id])
  if @user.id == current_user.id
    erb :'pets/new'
  else
    redirect "/users/#{current_user.id}/pets/new"
  end
end

# User pets show action
get '/users/:user_id/pets/:pet_id' do
  logged_in?
  petfinder = Petfinder::Client.new
  @user = User.find(params[:user_id])
  @pet = Pet.find(params[:pet_id])
  @shelter = petfinder.shelter(@pet.shelter_id) || false
  erb :'pets/show'
end

# Pets create action
post '/users/:user_id/pets' do
  @user = User.find(params[:user_id])
  @pet = @user.pets.new(params[:pet])
  @image = @pet.images.new(name: params[:image])

  if @pet.save && @image.save
    redirect "/users/#{@user.id}"
  else
    @errors = "Pet errors: \n#{@pet.errors.full_messages} \nImage errors: \n#{@image.errors.full_messages}"
    erb :'pets/new'
  end
end

# All pets index action
get '/pets' do
  logged_in?
  @pets = Pet.all
  erb :'pets/all_index'
end
