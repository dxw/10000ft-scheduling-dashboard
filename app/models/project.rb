class Project < SimpleDelegator
  def users
    client = TenThousandFeet.new(auth: ENV['scheduling_api_key'])
    users = client.get_project_users(id)['data']
    return [] if users.blank?
    users.map! { |user_args| User.new(user_args) }
  end

  def id
    self['id']
  end

  def name
    self['name']
  end
end
