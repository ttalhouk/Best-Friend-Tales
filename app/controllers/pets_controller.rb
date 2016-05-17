# User Pets index action
get '/users/:user_id/pets' do
  @user = User.find(params[:user_id])
  @pets = @user.pets.all
  erb :'pets/index'
end

# Pets new action
get '/users/:user_id/pets/new' do
  @user = User.find(params[:user_id])
  erb :'pets/new'
end

# User pets show action
get '/users/:user_id/pets/:pet_id' do
  @user = User.find(params[:user_id])
  @pet = Pet.find(params[:pet_id])
  erb :'pets/show'
end

# Pets create action
post '/users/:user_id/pets' do
  @user = User.find(params[:user_id])
  @pet = @user.pets.new(params[:pet])
  @image = @pet.images.new(name: params[:image])

  if @pet.save && @image.save
    redirect "/users/#{@user.id}/pets"
  else
    @errors = "Pet errors: \n#{@pet.errors.full_messages} \nImage errors: \n#{@image.errors.full_messages}"
    erb :'pets/new'
  end
end

# All pets index action
get '/pets' do
  @pets = Pet.all
  erb :'pets/all_index'
end
