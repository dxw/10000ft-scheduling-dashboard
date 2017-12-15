module TenThousandFeetWrapper
  def self.client
    raise ArgumentError, 'ENV is missing an API key: `SCHEDULING_API_KEY`' unless ENV['SCHEDULING_API_KEY'].present?
    TenThousandFeet.new(auth: ENV['SCHEDULING_API_KEY'])
  end
end
