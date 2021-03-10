require 'rails_helper'

RSpec.feature 'groups', type: :feature do
  let(:user) { User.create(name: 'Ashaka') }

  before(:each) do
    user
  end

  scenario 'when a user Creates a Group ' do
    visit '/'
    click_on 'LOG IN'
    fill_in 'Name', with: 'Ashaka'
    click_on 'LOG IN'
    click_on 'All groups'
    click_on 'NEW GROUP'
    fill_in 'Name', with: 'Group'
    click_on 'Create Group'
    expect(page).to have_content('Group')
  end

  scenario 'when a user Creates a Group with no name ' do
    visit '/'
    click_on 'LOG IN'
    fill_in 'Name', with: 'Ashaka'
    click_on 'LOG IN'
    click_on 'All groups'
    click_on 'NEW GROUP'
    fill_in 'Name', with: nil
    click_on 'Create Group'
    expect(page).to have_content("Name can't be blank")
  end
end
