class LeaveTypeFinder
  include TenkftClientWrapper

  def self.call
    TenkftClientWrapper.client.get_leave_types(per_page: 500)['data']
                       .map { |leave_args| LeaveType.new(leave_args) }
  end
end
