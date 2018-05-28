class Component
  attr_accessor :inputs
  attr_accessor :outputs
  attr_accessor :name

  def initialize
    @inputs = []
    @outputs = []
  end

  def add_input(conn)
    conn.add_observer(self)
    inputs << conn
  end

  def add_output(conn)
    outputs << conn
  end

  def update
    raise 'implement in sub class'
  end
end
