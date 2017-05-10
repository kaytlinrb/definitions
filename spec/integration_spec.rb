require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application


describe('word', {:type => :feature}) do
  it('contains area for displayed words') do
    visit('/')
    expect(page).to have_content('Words')
  end

  it('accepts and displays new word') do
    visit('/word/new')
    fill_in("word_entry", :with => 'dastardly')
    click_button('Add Word')
    visit('/')
    expect(page).to have_content('Dastardly')
  end
  it('shows an associated definition') do
  visit('/word/new')
  fill_in("word_entry", :with => 'restaurant')
  click_button('Add Word')
  visit('/words/1')
  fill_in("definition", :with => "")
  click_button('Add Definition')
  expect(page).to have_content(' ')
  end
end
