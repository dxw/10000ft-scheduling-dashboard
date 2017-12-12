require 'rails_helper'

RSpec.feature 'View the daily schedule' do
  scenario 'everyone is unassigned' do
    visit root_path
    expect(page).to have_content('Unassigned')
  end

  scenario 'there are multiple active projects' do
    visit root_path
    expect(page).to have_content('MyTVH')
    expect(page).to have_content('dxw - On call')
  end
end
