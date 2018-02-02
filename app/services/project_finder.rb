class ProjectFinder
  include TenThousandFeetWrapper
  def self.call
    TenThousandFeetWrapper.client
                          .get_projects(per_page: 500, with_phases: true)['data']
                          .map { |project_args| Project.new(project_args) }
  end
end
