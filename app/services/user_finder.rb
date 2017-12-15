class UserFinder
  include TenThousandFeetWrapper
  def self.call
    TenThousandFeetWrapper.client.get_users(per_page: 500)['data']
      .map { |user_args| User.new(user_args) }
  end
end
