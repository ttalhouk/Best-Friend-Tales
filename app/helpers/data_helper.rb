helpers do
  def gather_sentiment(paragraph)
    sentiment = RestClient.post("http://text-processing.com/api/sentiment/", text: paragraph)
    JSON.parse(sentiment)
  end

  def petfinder
    Petfinder::Client.new
  end

  def check_data(pet_list)
    clean_pets = []
    pet_list.each do |pet|
      if (pet.try(:name) &&
        pet.try(:sex) &&
        pet.breeds.join(" | ") &&
        pet.photos.last.try(:medium) &&
        pet.try(:animal) )
        clean_pets << pet
      end
    end
    return clean_pets
  end
end
