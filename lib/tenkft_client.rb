require 'httparty'

class TenkftClient
  API_BASE_URL = "https://app.10000ft.com/api/v1/"
  include HTTParty

  attr_reader :cookie

  def initialize
    raise ArgumentError, 'ENV is missing a key: `TENKFT_USERNAME`' unless ENV['TENKFT_USERNAME'].present?
    raise ArgumentError, 'ENV is missing a key: `TENKFT_PASSWORD`' unless ENV['TENKFT_PASSWORD'].present?

    post_response = HTTParty.post(
      'https://app.10000ft.com/api/sessions/signin',
      body: {
        user_id: ENV['TENKFT_USERNAME'],
        password: ENV['TENKFT_PASSWORD']
      },
    )

    @cookie = parse_cookie(post_response)[:'tenkft-x']
  end

  def get_projects(options)
    get('projects', options)
  end

  def get_users(options)
    get('users', options)
  end

  def get_assignments(user_id, options)
    get("users/#{user_id}/assignments", options)
  end

  def get_leave_types(options)
    get('leave_types', options)
  end

  def get(endpoint, options)
    HTTParty.get(
      API_BASE_URL + endpoint,
      headers: request_headers,
      query: options,
    )
  end

  def post(endpoint, payload)
    HTTParty.post(
      API_BASE_URL + endpoint,
      headers: request_headers,
      body: payload,
    )
  end

  private

  def parse_cookie(resp)
    cookie_hash = CookieHash.new
    resp.get_fields('Set-Cookie').each { |c| cookie_hash.add_cookies(c) }
    cookie_hash
  end

  def request_headers
    {
      "User-Agent" => "Httparty",
      "Cookie" => "tenkft-x=#{cookie};",
    }
  end
end
