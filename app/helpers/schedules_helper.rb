module SchedulesHelper
  def project_classes(project:)
    classes = []
    classes << project.name.parameterize
    classes << 'internal' if project.internal?
    classes << 'confirmed' if project.confirmed?
    classes << 'oncall' if project.oncall?
    classes.join(' ')
  end
end