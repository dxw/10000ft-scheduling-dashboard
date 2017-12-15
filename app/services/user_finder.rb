class UserFinder
  def self.call
    client = TenThousandFeet.new(auth: ENV['SCHEDULING_API_KEY'])
    client.get_users(per_page: 500)['data'].map! { |user_args| User.new(user_args) }
  end
end
