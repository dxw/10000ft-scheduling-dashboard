class Project
  attr_reader :id,
              :name,
              :state,
              :phase_name

  def initialize(args = {})
    args = args.symbolize_keys if args

    @id = args[:id]
    @name = args[:name]
    @state = args[:project_state]
    @phase_name = args[:phase_name]
  end

  # Assignments are passed in because the only way to get
  # assignments is by passing individual user_id's
  def assignments(assignments:)
    assignments.select{ |assignment| id == assignment.project_id }
  end

  def internal?
    return false unless state
    state.downcase.eql?('internal')
  end

  def tentative?
    return false unless state
    state.downcase.eql?('tentative')
  end

  def confirmed?
    return false unless state
    state.downcase.eql?('confirmed')
  end

  def oncall?
    return false unless name
    name.downcase.eql?('on call')
  end

  def leave?
    return false unless state
    state.downcase.eql?('leave')
  end
end
