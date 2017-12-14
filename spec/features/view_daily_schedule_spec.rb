require 'rails_helper'

RSpec.feature 'View the daily schedule' do
  let(:client) { double }
  before(:each) do
    stub_ten_thousand_feet_client(client: client)
    stub_ten_thousand_feet_project_response(client: client)
    stub_ten_thousand_feet_user_response(client: client)
    stub_ten_thousand_feet_assignment_response(client: client)
    stub_ten_thousand_feet_leave_types_response(client: client)
  end


  scenario 'when there are no projects' do
    allow(client).to receive(:get_projects)
      .and_return(TenThousandFeet.empty_project_response)

    visit root_path

    expect(page).to have_content(I18n.t('errors.projects.missing'))
  end

  scenario 'there are assignments for a project' do
    allow(client).to receive(:get_projects)
      .and_return(TenThousandFeet.project_response(project_id: 123, name: 'a-project-name'))
    allow(client).to receive(:get_assignments)
      .and_return(TenThousandFeet.assignment_response(project_id: 123, user_id: 'user-id'))
    allow(client).to receive(:get_users)
      .and_return(TenThousandFeet.user_response(user_id: 'user-id', first_name: 'first-name'))

    visit root_path

    within('.a-project-name') do
      expect(page).to have_content('A Project Name')
      expect(page).to have_content('first-name')
    end
  end

  scenario 'no assignments are on a project' do
    allow(client).to receive(:get_projects)
      .and_return(TenThousandFeet.project_response(name: 'a-project-name'))
    allow(client).to receive(:get_assignments)
      .and_return(TenThousandFeet.empty_assignment_response)

    visit root_path

    expect(page).not_to have_content('a-project-name')
  end

  scenario 'users without any assignments' do
    allow(client).to receive(:get_users)
      .and_return(TenThousandFeet.user_response(first_name: 'first-name'))

    visit root_path

    within('.unassigned') do
      expect(page).to have_content('Unassigned')
      expect(page).to have_content('first-name')
    end
  end

  scenario 'users are on holiday' do
    allow(client).to receive(:get_leave_types)
      .and_return(TenThousandFeet.leave_types_response(project_id: 123, name: 'Holiday'))
    allow(client).to receive(:get_assignments)
      .and_return(TenThousandFeet.assignment_response(project_id: 123, user_id: 456, ))
    allow(client).to receive(:get_users)
      .and_return(TenThousandFeet.user_response(user_id: 456, first_name: 'first-name'))

    visit root_path

    within('.holiday') do
      expect(page).to have_content('Holiday')
      expect(page).to have_content('first-name')
    end
  end

  scenario 'users are sick' do

  end
end
