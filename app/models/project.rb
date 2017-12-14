class Project < SimpleDelegator
  attr_reader :id,
              :name,
              :state

  def initialize(args = {})
    args = args.symbolize_keys if args

    @id = args[:id]
    @name = args[:name]
    @state = args[:project_state]
  end

  # Assignments are passed in because the only way to get
  # assignments is by passing individual user_id's
  def assignments(assignments:)
    assignments.select{ |assignment| id == assignment.project_id }
  end

  def internal?
    state.eql?('Internal')
  end

  def tentative?
    state.eql?('Tentative')
  end

  def confirmed?
    state.eql?('Confirmed')
  end

  def oncall?
    name.eql?('On Call')
  end
end
