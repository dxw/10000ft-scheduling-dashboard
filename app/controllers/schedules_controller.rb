class SchedulesController < ApplicationController
  def index
    data = []
    client = TenThousandFeet.new(auth: ENV['scheduling_api_key'])
    projects = client.get_projects['data']

    @projects_and_users = projects.inject({}) do |hash, project|
      users = client.get_project_users(project['id'])['data']
      hash.merge!(project => users)
      hash
    end
  end
end
