module TenkftClientWrapper
  def self.client
    raise ArgumentError, 'ENV is missing a key: `TENKFT_USERNAME`' unless ENV['TENKFT_USERNAME'].present?
    raise ArgumentError, 'ENV is missing a key: `TENKFT_PASSWORD`' unless ENV['TENKFT_PASSWORD'].present?

    TenkftClient.new(username: ENV['TENKFT_USERNAME'], password: ENV['TENKFT_PASSWORD'])
  end
end
