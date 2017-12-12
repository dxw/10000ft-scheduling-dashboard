require 'rails_helper'

RSpec.feature 'View the daily schedule' do
  before(:each) do
    client = double
    stub_ten_thousand_feet_client(client: client)
    stub_ten_thousand_feet_project_response(client: client)
    stub_ten_thousand_feet_user_response(client: client)
  end

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
