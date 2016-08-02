![Best Friend Tales](http://www.georgiaspca.org/sites/default/files/images/Paws-for-Consider-icon-v2.jpg)

# Best Friend Tales

This is a Sinatra app for pet lovers to find adoptable pets.

## Features

- Search of adoptable pets loaded on Petfinder and add them to your profile
- Search for local pets based on user location
- See contact information to adopt a pet
- Contact shelters directly through the website regarding adoption with pre-written email from users email account
- Add Pets to user profiles
- Create and edit posts
- Comment on posts
- See all comments and posts for every user
- See other users pets
- Mobile very-friendly
- Sentiment Analysis on the comments of a user's posts

![BFTales example](sinatra_version/public/images/readme-image.jpg)

## Getting Started: Sinatra

1. Fork the Repo

2. Clone the Repo down to your machine

3. ```cd``` into the Repo

4. ```cd sinatra_version```

5. ```bundle```

6. ```be rake db:drop```

7. ```be rake db:create```

8. ```be rake db:migrate```

9. ```be rake db:seed```

10. ```be shotgun```

Your app will now be running on [localhost:9393](http://localhost:9393).

#### If you see an ```undefined method 'images for nil:NilClass``` error, follow these steps:

1. Create a .env file in the /sinatra_version directory

2. Add these environment variables inside the file (with your keys):

```
PETFINDER_KEY=aaabababababaaaab2342342342342
PETFINDER_SECRET=aaabababababaaaab2342342342342
SENDGRID_APIKEY=aaabababababaaaab2342342342342
SENDGRID_PASSWORD=aaabababababaaaab2342342342342
SENDGRID_USERNAME=someherokuapp@heroku.com
```

3. Restart your server and run ```be shotgun```

## Getting Started: Rails

1. Fork the Repo

2. Clone the Repo down to your machine

3. ```cd``` into the Repo

4. ```cd rails_version```

5. ```bundle```

6. ```be rake db:drop```

7. ```be rake db:create```

8. ```be rake db:migrate```

9. ```be rake db:seed```

10. ```be rails server```

Your app will now be running on [localhost:3000](http://localhost:3000).

#### To set your environment variables, follow these steps:

1. From rails_version directory, ```cd config```

2. Create a file called application.yml

3. Add these environment variables inside the application.yml (with your keys):

```
PETFINDER_KEY: aaabababababaaaab2342342342342
PETFINDER_SECRET: aaabababababaaaab2342342342342
SENDGRID_APIKEY: aaabababababaaaab2342342342342
SENDGRID_PASSWORD: aaabababababaaaab2342342342342
SENDGRID_USERNAME: someherokuapp@heroku.com
```

4. Restart your server and run ```be rails s```

## Contributors

* [kelsonic](https://github.com/kelsonic)
* [ttalhouk](https://github.com/ttalhouk)

## APIs

* SendGrid
* Petfinder
* Text-Processing Sentiment Analysis

## MIT License

MIT License. View it [here](LICENSE).