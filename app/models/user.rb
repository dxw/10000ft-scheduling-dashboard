class User < SimpleDelegator
  attr_reader :id,
              :first_name,
              :display_name,
              :thumbnail

  def initialize(args = {})
    args = args.symbolize_keys if args

    @id = args[:id]
    @first_name = args[:first_name]
    @display_name = args[:display_name]
    @thumbnail = args[:thumbnail].blank? ? default_thumbnail : args[:thumbnail]
  end

  private def default_thumbnail
    'anon.jpg'
  end
end
