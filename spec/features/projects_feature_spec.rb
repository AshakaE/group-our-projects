require 'rails_helper'

# rubocop:disable Metrics/BlockLength

RSpec.feature 'projects', type: :feature do
  let(:user) { User.create(name: 'Ashaka') }

  before(:each) do
    user
  end

  scenario 'when a user Creates a Project' do
    visit '/'
    click_on 'LOG IN'
    fill_in 'Name', with: 'Ashaka'
    click_on 'LOG IN'
    click_on 'All my projects'
    click_on 'NEW PROJECT'
    fill_in 'Name', with: 'Project'
    fill_in 'Description', with: 'Project desp'
    fill_in 'Amount', with: 2
    click_on 'Create Project'
    expect(page).to have_content('Project')
  end

  scenario 'when a user Creates a Project with name < 4 chars' do
    visit '/'
    click_on 'LOG IN'
    fill_in 'Name', with: 'Ashaka'
    click_on 'LOG IN'
    click_on 'All my projects'
    click_on 'NEW PROJECT'
    fill_in 'Name', with: 'Pro'
    fill_in 'Description', with: 'Project desp'
    fill_in 'Amount', with: 2
    click_on 'Create Project'
    expect(page).to have_content('Name is too short (minimum is 4 characters)')
  end

  scenario 'when a user Creates a Project with description < 10 chars' do
    visit '/'
    click_on 'LOG IN'
    fill_in 'Name', with: 'Ashaka'
    click_on 'LOG IN'
    click_on 'All my projects'
    click_on 'NEW PROJECT'
    fill_in 'Name', with: 'Project'
    fill_in 'Description', with: 'Project'
    fill_in 'Amount', with: 2
    click_on 'Create Project'
    expect(page).to have_content('Description is too short (minimum is 10 characters)')
  end

  scenario 'when a user Creates a Project with no amount(hrs)' do
    visit '/'
    click_on 'LOG IN'
    fill_in 'Name', with: 'Ashaka'
    click_on 'LOG IN'
    click_on 'All my projects'
    click_on 'NEW PROJECT'
    fill_in 'Name', with: 'Project'
    fill_in 'Description', with: 'Project'
    fill_in 'Amount', with: nil
    click_on 'Create Project'
    expect(page).to have_content("Amount can't be blank")
  end
end

# rubocop:enable Metrics/BlockLength
