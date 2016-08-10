module GetPet

def self.adoptible
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
  return @pets
end

def self.local_pets(zip)
  pet_data = [["dog", 7], ["cat", 7], ["bird", 3], ["reptile", 1], ["smallfurry", 2]].map do |animal|
    petfinder.find_pets(animal[0], zip).sample(animal[1])
  end

  @pets = check_data(pet_data.flatten!)
  @pets = @pets.uniq.shuffle
  return @pets
end

end
