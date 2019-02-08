class AssignmentFinder
  include TenkftClientWrapper

  def self.call(users:, from: Date.current, to: Date.current)
    client = TenkftClientWrapper.client

    users.map do |user|
      client.get_assignments(user.id, per_page: 500, from: from, to: to)['data']
        .map { |assignment_args| Assignment.new(assignment_args) }
    end.flatten
  end
end
