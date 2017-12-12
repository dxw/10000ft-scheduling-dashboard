class User < SimpleDelegator
  def first_name
    self['first_name']
  end

  def display_name
    self['display_name']
  end

  def thumbnail
    self['thumbnail'].present? ? self['thumbnail'] : default_thumbnail
  end

  private def default_thumbnail
    'wall.jpg'
  end
end
