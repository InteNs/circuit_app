require 'observer'

class Connection
  include Observable
  attr_reader :state

  def initialize(state = ConnectionStateLow)
    @state = state
  end

  def state=(state)
    @state = state
    changed
    notify_observers
  end
end
