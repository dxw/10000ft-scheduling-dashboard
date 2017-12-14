class TodayScheduleFacade
  def projects
    @projects ||= ProjectFinder.call
  end

  def todays_assignments
    @todays_assignments ||= AssignmentFinder.call(users: users, from: Date.current, to: Date.current)
  end

  def users
    @users ||= UserFinder.call
  end

  def leave_types
    @leave_types ||= LeaveTypeFinder.call
  end

  def holiday_assignments
    holiday = leave_types.detect{ |leave_type| leave_type.name.eql?('Holiday') }
    return [] unless holiday
    @holiday_assignments ||= todays_assignments.select{ |assignment| holiday.id == assignment.project_id }
  end

  def sick_assignments
    sick = leave_types.detect{ |leave_type| leave_type.name.eql?('Sick') }
    return [] unless sick
    @sick_assignments ||= todays_assignments.select{ |assignment| sick.id == assignment.project_id }
  end

  def users_without_assignments
    users_with_assignments = todays_assignments.map(&:user_id)
    @users_without_assignments ||= users.select{ |user| !users_with_assignments.include?(user.id) }
  end
end
