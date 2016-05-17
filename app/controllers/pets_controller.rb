# User Pets index action
get '/users/:user_id/pets' do
  @user = User.find(params[:user_id])
  @pets = @user.pets.all
  erb :'pets/index'
end

# Pets new action
get '/users/:user_id/pets/new' do
  erb :'pets/new'
end

# Pets create action
post '/users/:user_id/pets' do
  @user = User.find(params[:user_id])
  @pet = @user.pets.new(params[:pet])
  if @pet.save
    redirect "/users/#{@user.id}/pets/#{@pet.id}"
  else
    @errors = @pet.errors.full_messages
    erb :'pets/new'
  end
end

# All pets index action
get '/pets' do
  @pets = Pet.all
  erb :'pets/all_index'
end
