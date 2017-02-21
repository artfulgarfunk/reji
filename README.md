# README

## User Stories
```
As a user, I can view a list of restaurants with their reviews and average rating.

As a user, I can leave reviews for restaurants

As a user, I can edit the restaurant profiles

As a user I can delete restaurant profiles

As a user, I can create new restaurants

```

## Rails Set Up

#### Install Rails
```
$ gem install rails
```
#### Make a Rails app project

Where:
- *reji* is the name of the app;
- *-d* postgresql to use postgreSQL instead of the default SQLite;
- *-T* to switch off the default testing framework.

```
$ rails new reji -d postgresql -T
```
#### Build database
```
$ bin/rake db:create
```

#### Initialise git

Set up git in the app root

#### Start server

Responses go to localhost:3000

Depending on the system, it may or may not be necessary to run the second command too.
```
$ bin/rake server OR bin/rake s
```
```
$ bin/rake db:create RAILs_ENV=test
```

#### Add testing gems to gemfile

```ruby
group :test do
  gem 'rspec-rails'
  gem 'capybara'
end
```

#### Run bundler to install the gems
```
$ bundle
```
#### Set up spec files

Auto generate dir with spec/spec_helper.rb and spec/rails_helper.rb . Also create .rspec file. Can abbreviate generate to g here and in following commands.

```
$ bin/rails generate rspec:install
```
#### Require Capybara in spec/rails_helper.rb
```
require 'capybara/rails'
```
## First App Files

#### Test

``` ruby
# spec/features/restaurants_feature_spec.rb

require 'rails_helper'

feature 'restaurants' do
  context 'no restaurants have been added' do
    scenario 'should display a prompt to add a restaurant' do
      visit '/restaurants'
      expect(page).to have_content 'No restaurants yet'
      expect(page).to have_link 'Add a restaurant'
    end
  end
end
```
#### Routes

``` ruby
# config/routes.rb

Rails.application.routes.draw do
  resources :restaurants
end
```
To get list of routes created run:

```
bin/rake routes
```

#### Controllers

Generate app/controllers/restaurants_conroller.rb plus some helpers, js and css files.

```
$ bin/rails g controller restaurants
```

#### Views

```
$ touch app/views/restaurants/index.html.erb
```

Then

``` ruby
# app/views/restaurants/index.html.erb:

No restaurants yet
<a href='#'>Add a restaurant</a>
```

Each view is automatically wrapped in a layout file at app/views/layouts/

#### Models
