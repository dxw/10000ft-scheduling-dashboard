class User
  TAGS_TO_EXCLUDE_FROM_DASHBOARD = [
    'hide-from-dashboard',
    'unbillable',
    'cyber'
  ].freeze

  attr_reader :id,
              :first_name,
              :display_name,
              :thumbnail,
              :tags

  def initialize(args = {})
    args = args.symbolize_keys if args

    @id = args[:id]
    @first_name = args[:first_name]
    @display_name = args[:display_name]
    @thumbnail = args[:thumbnail].blank? ? default_thumbnail : args[:thumbnail]
    @tags = extract_tags(args)
  end

  def blacklisted?
    !(tags & TAGS_TO_EXCLUDE_FROM_DASHBOARD).empty?
  end

  private def extract_tags(args)
    tags = args[:tags]
    return [] unless tags && tags['data']
    tags.symbolize_keys[:data].map { |tag| tag['value'].downcase }
  end

  private def default_thumbnail
    'anon.png'
  end
end
