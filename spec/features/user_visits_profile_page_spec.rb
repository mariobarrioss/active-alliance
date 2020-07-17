require 'rails_helper'

feature 'user visits profile page' do
  scenario 'user can see links to All my activities, All my external activities, All groups' do
    user = create(:user)
    login_as(user, scope: :user)
    visit root_path

    expect(page).to have_link 'All my activities'
    expect(page).to have_link 'All my external activities'
    expect(page).to have_link 'All Groups'
  end
end
