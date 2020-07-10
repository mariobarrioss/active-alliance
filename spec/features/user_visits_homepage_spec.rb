require 'rails_helper'

feature 'user visits homepage' do
  scenario 'unsigned user visits homepage' do
    visit root_path

    expect(page).to have_content 'You need to sign in or sign up before continuing.'
  end

  scenario 'signed_in user visits homepage' do
    user = create(:user)
    login_as(user, scope: :user)
    visit root_path

    expect(page).to have_content 'All my activities'
  end
end
