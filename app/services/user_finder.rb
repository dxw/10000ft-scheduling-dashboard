class UserFinder
  def self.call
    TenkftClient.new.get_users(per_page: 500, fields: 'tags')['data']
                .map { |user_args| User.new(user_args) }
                .reject(&:blacklisted?)
  end
end
