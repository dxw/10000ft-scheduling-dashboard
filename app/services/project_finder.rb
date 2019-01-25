class ProjectFinder
  def self.call
    TenkftClient.new
                .get_projects(per_page: 500, with_phases: true)['data']
                .map { |project_args| Project.new(project_args) }
  end
end
