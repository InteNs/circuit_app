class Connection < Array
  def [](location)
    if index?(location)
      super(location)
    else
      find { |comp| comp.name.eql? location }
    end
  end

  def []=(location, component)
    if !index?(location)
      index = find_index { |comp| comp.name.eql? location }
      super(index, component)
    else
      super(location, component)
    end
  end

  private

  def index?(val)
    val.is_a? Integer
  end
end

