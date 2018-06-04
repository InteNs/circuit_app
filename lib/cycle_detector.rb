class CycleDetector
  def initialize(graph)
    @graph = graph
  end

  def cycle_detected?
    strongly_connected_components.select {|a| a.length > 1 }
  end

  ## Tarjan's algorithm

end
