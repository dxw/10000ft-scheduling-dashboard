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

  def ooo_assignments
    return [] unless leave_types

    leave_types.inject({}) do |assignments, leave_type|
      matching_assignments = todays_assignments.select { |assignment| leave_type.id == assignment.project_id }
      next assignments if matching_assignments.empty?

      assignments.merge!(leave_type.name => matching_assignments)
    end
  end

  def users_without_assignments
    users_with_assignments = todays_assignments.map(&:user_id)
    @users_without_assignments ||= users.select{ |user| !users_with_assignments.include?(user.id) }
  end
end
