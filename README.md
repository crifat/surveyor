## Surveyor
A project to demonstrate a survey management with admin panel and api. 

### Requirements:
* [docker](https://docs.docker.com/install/) 
* [docker-compose](https://docs.docker.com/compose/install/) 

### Run Project

1. `git clone git@github.com:nigh7m4r3/surveyor.git`
2. `docker-compose build`
2. `docker-compose up`

#### URLs
* Project Home: http://localhost:3000 
* Admin Panel: http://localhost:3000/admin 

Admin Credential: 

email: `admin@example.com`

password: `password`

#### Test
* run in terminal: `docker exec -ti surveyor bash -c "RAILS_ENV=test bundle exec rspec"`

#### Generate Api Doc
* run in terminal: `docker exec -ti surveyor bash -c "RAILS_ENV=test bundle exec rake docs:generate"`.