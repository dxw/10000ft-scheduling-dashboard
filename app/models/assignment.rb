class Assignment < SimpleDelegator
  attr_reader :project_id,
              :user_id,
              :starts_at,
              :ends_at

  def initialize(args = {})
    args = args.symbolize_keys if args

    @project_id = args[:project_id] || args[:assignable_id]
    @user_id = args[:user_id]
    @starts_at = Date.parse(args[:starts_at]) if args[:starts_at]
    @ends_at = Date.parse(args[:ends_at]) if args[:ends_at]
  end
end
