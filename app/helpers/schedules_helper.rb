module SchedulesHelper
  def project_classes(project:)
    classes = []
    classes << project.name.parameterize
    classes << 'internal' if project.internal?
    classes << 'confirmed' if project.confirmed?
    classes << 'tentative' if project.tentative?
    classes << 'oncall' if project.oncall?
    classes << 'leave' if project.leave?
    classes.join(' ')
  end

  def nickname(user:)
    case user.id
    when 389583 then 'alex j'
    when 512052 then 'alex y'
    when 478731 then 'chris l'
    when 472497 then 'chris p'
    when 478728 then 'chris r'
    when 389584 then 'chris w'
    when 387517 then 'hippers'
    when 614183 then 'james c'
    when 614184 then 'james s'
    when 389616 then 'leeky'
    when 389599 then 'leanne c'
    when 389601 then 'leanne g'
    when 389614 then 'vee'
    else user.first_name
    end
  end

  def display_tags(user:)
    user.tags.join(', ')
  end

  def project_description(project:)
    return project.name unless project.phase_name
    "#{project.name} - #{project.phase_name}"
  end
end
