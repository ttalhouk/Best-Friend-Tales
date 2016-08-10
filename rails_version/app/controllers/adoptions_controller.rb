class AdoptionsController < ApplicationController
  include GetPet
  def random
    #logged_in? # look up devise equivelent
    user_signed_in?
    @pets = GetPet.adoptible
    # Modify Ajax for rails to render partials
    # if request.xhr?
    #   return erb :'adoptions/_index', layout: false, locals: {pets: @pets}
    # else
      render action: "index"
    # end
  end

  def local
    #logged_in? # look up devise equivelent
    user_signed_in?
    @pets = GetPet.local_pets(current_user.zip) # look up devise equeivelent to current_user
    # Modify Ajax for rails to render partials
    # if request.xhr?
    #   return erb :'adoptions/_index', layout: false, locals: {pets: @pets}
    # else
      render action: "index"
    # end

  end

end
