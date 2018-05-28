class ConnectionState
  def initialize(connection)
    @connection = connection
  end

  def self.to_bool
    raise 'implement in subclass'
  end

  def self.from_bool(bool)
    # TODO: anti-pattern
    bool ? ConnectionStateHigh : ConnectionStateLow
  end
end
