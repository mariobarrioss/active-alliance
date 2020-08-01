require 'rails_helper'

feature 'user visits group activities page' do
  scenario 'user can see a list with all activities assigned to specific group' do
    user = create(:user)
    login_as(user, scope: :user)
    group = create(:group)
    activity = create(:activity, author: user)
    other_activity = create(:activity, author: user)
    GroupActivity.create(group: group, activity: activity)
    GroupActivity.create(group: group, activity: other_activity)
    visit root_path
    click_link 'All Groups'
    click_on group.name
    expect(page).to have_content activity.description
    expect(page).to have_content other_activity.description
  end
end
