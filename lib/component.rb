class Component
  attr_accessor :inputs
  attr_accessor :outputs

  def initialize
    @inputs = []
    @outputs = []
    @delay_in_ns = 15
  end

  def add_input(conn)
    conn.add_observer(self)
    inputs << conn
  end

  def add_output(conn)
    outputs << conn
  end

  def update
    simulate
  end

  def simulate; end
end
