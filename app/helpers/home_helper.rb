helpers do
  def adopt_this_pet
    chosen_pet = Pet.all.sample
    adopt_this_pet.is_pet_of_user == true ? adopt_this_pet : chosen_pet
  end
end
