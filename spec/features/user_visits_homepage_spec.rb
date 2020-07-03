require 'rails_helper'

feature 'user visits homepage' do
  scenario 'unsigned user visits homepage' do
    visit root_path
    expect(page).to have_content 'welcome to rails'
  end
end
