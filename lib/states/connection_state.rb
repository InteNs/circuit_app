class ConnectionState
  def initialize(connection)
    @connection = connection
  end

  def transfer
    raise 'implement in subclass'
  end
end
