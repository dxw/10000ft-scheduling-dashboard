module SchedulesHelper
  def project_classes(project:)
    classes = []
    classes << project.name.parameterize
    classes << 'internal' if project.internal?
    classes << 'confirmed' if project.confirmed?
    classes << 'oncall' if project.oncall?
    classes << 'leave' if project.leave?
    classes.join(' ')
  end

  def nickname(user:)
    case user.id
    when 387517 then 'hippers'
    when 389616 then 'leeky'
    when 389586 then 'duncan b'
    when 389587 then 'duncan s'
    when 389599 then 'leanne c'
    when 389601 then 'leanne g'
    when 389614 then 'vee'
    else user.first_name
    end
  end
end
