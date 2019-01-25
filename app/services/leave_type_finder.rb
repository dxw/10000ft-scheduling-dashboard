class LeaveTypeFinder
  def self.call
    TenkftClient.new.get_leave_types(per_page: 500)['data']
      .map { |leave_args| LeaveType.new(leave_args) }
  end
end
