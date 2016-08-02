get "/users/:user_id/pets/:pet_id/mailers/new" do
  @user = User.find(params[:user_id])
  @pet = Pet.find(params[:pet_id])
  @shelter = petfinder.shelter(@pet.shelter_id)

  if @shelter.try(:email) && (is_valid_email?(@shelter.email) == 0)

    # this is a helper to create a sendgrid client
    sendgrid_client

    mail = SendGrid::Mail.new do |m|
      m.to = @shelter.email
      m.from = @user.email
      m.subject = params[:subject]
      m.text = params[:message]
    end

    res = sendgrid_client.send(mail)
    puts res.code
    puts res.body
    @success = "Your message was sent successfully!"
    erb :'pets/show'
  else
    @errors = ["There's no email for #{@pet.name}.", "Call #{@shelter.phone} for more info on #{@pet.name}."]
    erb :'pets/show'
  end
end
