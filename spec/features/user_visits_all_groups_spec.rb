require 'rails_helper'

feature 'user visits all my groups page' do
  scenario 'user can see a list with all grouped and ungrouped activities' do
    user = create(:user)
    login_as(user, scope: :user)
    group = create(:group)
    other_group = create(:group)
    visit root_path
    click_link 'All Groups'
    expect(page).to have_content group.name
    expect(page).to have_content other_group.name
  end
end
