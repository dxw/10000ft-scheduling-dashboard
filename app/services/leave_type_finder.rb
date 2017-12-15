class LeaveTypeFinder
  include TenThousandFeetWrapper
  def self.call
    TenThousandFeetWrapper.client.get_leave_types(per_page: 500)['data']
      .map { |leave_args| LeaveType.new(leave_args) }
  end
end
