require 'rails_helper'

feature 'user visits all my activities page' do
  scenario 'user can see a list with all grouped and ungrouped activities' do
    user = create(:user)
    login_as(user, scope: :user)
    activity = create(:activity, author: user)
    other_activity = create(:activity, :no_group, author: user)
    visit root_path
    click_link 'All my activities'
    expect(page).to have_content activity.description
    expect(page).to have_content other_activity.description
  end
end
