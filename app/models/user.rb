class User < SimpleDelegator
  def display_name
    self['display_name']
  end
end
