class AssignmentFinder
  def self.call(users:, from: Date.current, to: Date.current)
    client = TenkftClient.new

    users.map do |user|
      client.get_assignments(user.id, per_page: 500)['data']
            .map { |assignment_args| Assignment.new(assignment_args) }
            .select { |assignment| from >= assignment.starts_at && to <= assignment.ends_at }
    end.flatten
  end
end
