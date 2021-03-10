require 'rails_helper'

RSpec.feature 'Users', type: :feature do
  before(:each) do
    User.create(name: 'Ashaka')
    User.create(name: 'Voris')
    visit '/'
    click_on 'LOG IN'
    fill_in 'Name', with: 'Ashaka'
  end
  scenario 'when a user logs in' do
    click_on 'LOG IN'
    expect(page).to have_content('Ashaka')
  end

  scenario 'when a user logs out' do
    click_on 'LOG IN'
    click_on 'Logout'
    expect(page).to have_content('logged out')
  end

  scenario 'when a user tries to change name to an already existing name' do
    click_on 'LOG IN'
    click_on 'Ashaka'
    fill_in 'Ashaka', with: 'Voris'
    click_on 'Save changes'
    expect(page).to have_content('Name has already been taken')
  end

  scenario 'when a user tries to change name to an non-existing name' do
    click_on 'LOG IN'
    click_on 'Ashaka'
    fill_in 'Ashaka', with: 'Braun'
    click_on 'Save changes'
    expect(page).to have_content('Your display name was successfully updated.')
  end

  scenario 'when a new user tries to create a name that exists already' do
    visit '/'
    click_on 'SIGN UP'
    fill_in 'Name', with: 'Ashaka'
    click_on 'SIGN UP'
    expect(page).to have_content('Name has already been taken')
  end

  scenario 'when a new user creates an account with valid and non-existing name' do
    visit '/'
    click_on 'SIGN UP'
    fill_in 'Name', with: 'Braun'
    click_on 'SIGN UP'
    expect(page).to have_content('Braun, your account was created successfully.')
  end
end
