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
  if @pet.is_pet_of_user == false
    @shelter = petfinder.shelter(@pet.shelter_id)
  else
    @shelter = "None"
  end
  erb :'pets/show'
end

# Pets create action
post '/users/:user_id/pets' do
  p params[:pet]
  @user = User.find(params[:user_id])
  @pet = @user.pets.new(params[:pet])
  @image = @pet.images.new(name: params[:image])

  if @pet.save && @image.save
    redirect "/users/#{@user.id}"
  else
    @errors = ["Pet errors:","#{@pet.errors.full_messages}", "Image errors: ", "#{@image.errors.full_messages}"]
    erb :'pets/new'
  end
end

get '/users/:id/pets' do
  logged_in?
  @user = User.find(params[:id])
  @pets = @user.pets
  if is_current_user?(@user)
    erb :'users/pets'
  else
    redirect :"/users/#{current_user.id}"
  end
end

delete '/users/:user_id/pets/:pet_id' do
  logged_in?
  @user = User.find(params[:user_id])
  @pets = @user.pets
  Pet.find(params[:pet_id]).destroy
  @success = "Pet was removed successfully."
  erb :"users/show"
end
