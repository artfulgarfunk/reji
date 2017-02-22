require 'rails_helper'

describe Restaurant, type: :model do
  it 'is not valid with a name of less than 3 characters' do
    restaurant = Restaurant.new(name: "k")
    expect(restaurant).to have(1).error_on(:name)
    expect(restaurant).not_to be_valid
  end

  it 'is not valid unless it has a unique name' do
    Restaurant.create(name: 'Irenes Tavern')
    rest = Restaurant.new(name: 'Irenes Tavern')
    expect(rest).to have(1).error_on(:name)
  end 
end
