require 'observer'

class Connection
  include Observable
  attr_reader :state

  def initialize(state = false)
    @state = state
  end

  def state=(state)
    @state = state
    notify
  end

  def notify
    changed true
    notify_observers
  end
end
