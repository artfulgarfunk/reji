# README

## User Stories
```
As a user, I can view a list of restaurants with their reviews and average rating.

As a user, I can leave reviews for restaurants

As a user, I can edit the restaurant profiles

As a user I can delete restaurant profiles

As a user, I can create new restaurants

```

## Quick & Dirty Rails

#### Install

```
$ gem install rails
```

#### Make directory

```
$ rails new reji -d postgresql -T
```

#### Build db

```
$ bin/rake db:create
```

#### Start server localhost:3000

```
$ bin/rails server OR bin/rails s

$ bin/rake db:create RAILs_ENV=test # optional
```

#### Gemfile

```ruby
group :test do
  gem 'rspec-rails'
  gem 'capybara'
end
```

```
$ bundle
```

#### RSpec

```
$ bin/rails g rspec:install
```

> spec/spec_helper.rb

> spec/rails_helper.rb

> .rspec

#### Capybara

``` ruby
# spec/rails_helper.rb

require 'capybara/rails'
```

#### Feature test

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

###### config/routes.rb

``` ruby
# config/routes.rb

Rails.application.routes.draw do
  resources :restaurants
end
```

```
bin/rake routes
```

#### Controllers

###### app/controllers/restaurants_controller.rb

```
$ bin/rails g controller restaurants
```

> app/controllers/restaurants_controller.rb

> helpers, js & css files


#### Views

###### app/views/restaurants/index.html.erb

``` ruby
# app/views/restaurants/index.html.erb

No restaurants yet
<a href='#'>Add a restaurant</a>
```

> app/views/layouts/

#### Models

###### db/migrate/20170221152800_create_restaurants.rb

``` ruby
# spec/features/restaurants_feature_spec.rb

...
context 'restaurants have been added' do
  before do
    Restaurant.create(name: 'KFC')
  end

  scenario 'display restaurants' do
    visit '/restaurants'
    expect(page).to have_content('KFC')
    expect(page).not_to have_content('No restaurants yet')
  end
end
...
```

```
$ bin/rails g model restaurant name:string rating:integer

$ bin/rake db:migrate

$ bin/rake db:migrate RAILS_ENV=test # optional

```

#### Drop migration

```
$ bin/rails d migration <MigrationName>

# Then drop db tables and:

$ bin/rake db:migrate
```

#### Displaying

``` ruby
# app/controllers/restaurants_controller.rb

class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
  end
end
```

``` ruby
# app/views/restaurants/index.html.erb

<% if @restaurants.any? %>
  <% @restaurants.each do |restaurant| %>
    <h2> <%= restaurant.name %> </h2>
  <% end %>
<% else %>
  No restaurants yet
<% end %>

<a href='#'>Add a restaurant</a>

```

etc...
