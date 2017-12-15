class ProjectFinder
  def self.call
    client = TenThousandFeet.new(auth: ENV['SCHEDULING_API_KEY'])
    client.get_projects(per_page: 500)['data'].map! { |project_args| Project.new(project_args) }
  end
end
