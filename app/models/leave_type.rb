class LeaveType
  attr_reader :id, :name

  def initialize(args = {})
    args = args.symbolize_keys if args

    @id = args[:id]
    @name = args[:name]
  end
end
