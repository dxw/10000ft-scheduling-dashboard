require 'httparty'

class TenkftClient
  API_BASE_URL = "https://app.10000ft.com/api/v1/"
  include HTTParty

  attr_reader :cookie, :auth_token, :error_message

  def initialize(username:, password:)
    @error_message = nil

    post_response = HTTParty.post(
      'https://app.10000ft.com/api/sessions/signin',
      headers: {
        "Origin" => 'https://app.10000ft.com',
        "Referer" => 'https://app.10000ft.com/si'
      },
      body: {
        user_id: username,
        password: password
      },
    )

    @auth_token = post_response["auth_token"]
    @cookie = parse_cookie(post_response)[:'tenkft-x']

    if @auth_token.blank? && @cookie.blank?
      @error_message = 'Could not authenticate.'
    end
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
    if auth_token
      HTTParty.get(
        API_BASE_URL + endpoint + "?auth_token=#{auth_token}",
        query: options
      )
    elsif cookie
      HTTParty.get(
        API_BASE_URL + endpoint,
        headers: request_headers,
        query: options,
      )
    end
  end

  def post(endpoint, payload)
    if auth_token
      HTTParty.post(
        API_BASE_URL + endpoint + "?auth_token=#{auth_token}",
        body: payload,
      )
    elsif cookie
      HTTParty.post(
        API_BASE_URL + endpoint,
        headers: request_headers,
        body: payload,
      )
    end
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
