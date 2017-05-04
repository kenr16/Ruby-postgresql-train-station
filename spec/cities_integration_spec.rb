require "capybara/rspec"
require "./app"

Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('the cities path', {:type => :feature}) do

  it ('Takes user input city and adds it to cities page.') do
    visit('/')
    click_link('View All Cities')
    fill_in('city_name', :with => 'Seaside')
    click_button('Add City')
    expect(page).to have_content('Seaside')
  end
end


describe('the trains path', {:type => :feature}) do

  it ('Takes user input train and adds it to trains page.') do
    visit('/')
    click_link('View All Trains')
    fill_in('train_name', :with => 'Seabird')
    fill_in('train_type', :with => 'Amphibious train')
    click_button('Add Train')
    expect(page).to have_content('Seabird')
  end
end
