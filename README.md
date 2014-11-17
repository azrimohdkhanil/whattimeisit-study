whattimeisit
============

Codemalaysia - PFS Assignment

# Installation

```
git clone https://github.com/azrimohdkhanil/whattimeisit-study.git
```

```
bundle install
```

```
rake db:migrate
```

````
rake db:seed
```
there are seeds for the admin account
look at db/seed.rb
email : admin@whattimeisit.com
password : secret

### Set the environment variables for mailtrap username and password in the server terminal

let's take a look the the development config last few lines

config/environments/development.rb

```ruby
config.action_mailer.delivery_method = :smtp
	config.action_mailer.smtp_settings = {
	  :user_name => ENV['MAILTRAPUSERNAME'],
	  :password => ENV['MAILTRAPPASSWORD'],
	  :address => 'mailtrap.io',
	  :domain => 'mailtrap.io',
	  :port => '2525',
	  :authentication => :cram_md5
	}
```

notice the two env variables MAILTRAPUSERNAME and MAILTRAPPASSWORD?
run these commands in the terminal

```
export MAILTRAPPASSWORD=yourmailtrappassword
export MAILTRAPUSERNAME=yourmailtrapusername
```

next change the mailer default url to your liking

config/application.rb
```
config.action_mailer.default_url_options = { host: 'run.imranismail.me' }
```

# Things I've done in the app
1. User creation (email, password, name)
2. User profile
3. Gravatar profile image request
4. User ACL
5. User CRUD operations (create, read, update and delete)
6. Static pages
7. Mailtrap
8. Session flash using bootstrap alerts
9. Proper ACLed redirections
