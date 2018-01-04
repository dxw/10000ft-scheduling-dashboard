class UserFinder
  include TenThousandFeetWrapper
  def self.call
    TenThousandFeetWrapper.client.get_users(per_page: 500, fields: 'tags')['data']
                          .map { |user_args| User.new(user_args) }
                          .reject(&:blacklisted?)
  end
end
