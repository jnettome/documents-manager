# odonto-files

This project is a [Rails](http://rubyonrails.org/) application used to manage user documents. WIP prototype.

## Dependencies

To run this project you need to have:

* Ruby 2.1.2 - You can use [RVM](http://rvm.io)
* [PostgreSQL](http://www.postgresql.org/)
  * OSX - [Postgress.app](http://postgresapp.com/)
  * Linux - `$ sudo apt-get install postgresql`
  * Windows - [PostgreSQL for Windows](http://www.postgresql.org/download/windows/)

If you plan to **integrate** this project to Heroku, you'll need:

* [Heroku Toolbelt](https://toolbelt.heroku.com/)

## Setup the project

1. Install the depedencies above
2. `$ git clone <REPOSITORY_URL> odonto-files` - Clone the project
3. `$ cd odonto-files` - Go into the project folder
4. `$ bundle install` - Install the gem dependencies
5. `$ bundle exec rake db:setup` - Setup the database
6. `$ bundle exec rake spec` - Run the specs to see if everything is working fine

If everything goes OK, you can now run the project!

You can see an example here: http://showterm.io/6a0054fb8b6b53a56ef2c#slow

## Running the project

1. `$ bundle exec foreman start` - Opens the server
2. Open [http://localhost:3000](http://localhost:3000)

#### Running specs and checking coverage

`$ bundle exec rake spec` to run the specs.

`$ coverage=on bundle exec rake spec` to generate the coverage report then open the file `coverage/index.html` on your browser.

## Deploying the project to Heroku

:warning: This is the **ONLY RECOMMENDED WAY** to integrate this project, please do not push directly to Heroku.

#### Deploying the project to a single/staging app on Heroku

1. You are working on `master` branch
2. `$ bundle exec rake integrate` - Deploy everything to your app
3. Check if the changes are working on Heroku

You can see an example here: http://showterm.io/a4f25718904e532b321ad#slow