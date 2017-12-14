class LeaveTypeFinder
  def self.call
    client = TenThousandFeet.new(auth: ENV['scheduling_api_key'])
    client.get_leave_types(per_page: 500)['data'].map! { |leave_args| LeaveType.new(leave_args) }
  end
end
