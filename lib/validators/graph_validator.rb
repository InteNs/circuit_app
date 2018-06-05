class GraphValidator
  def initialize(connections)
    @connections = graph(connections)
  end

  def validate
    strongly_connected_components(@connections).select { |a| a.length > 1 }.none?
  end

  private

  def graph(connections)
    connections.each_with_object([]) do |(key, value), graph|
      value.each { |v| graph << [key, v] }
    end
  end

  def strongly_connected_components(graph)
    @index, @stack, @indice, @lowlink, @scc = 0, [], {}, {}, []
    @graph = graph
    @graph.flatten(1).uniq.each { |v| strong_connect(v) unless @indice[v] }
    @scc
  end

  def strong_connect(v)
    @indice[v] = @index
    @lowlink[v] = @index
    @index += 1
    @stack.push(v)
    @graph.each do |vv, w|
      next unless vv == v
      if !@indice[w]
        strong_connect(w)
        @lowlink[v] = [@lowlink[v], @lowlink[w]].min
      elsif @stack.include?(w)
        @lowlink[v] = [@lowlink[v], @indice[w]].min
      end
    end
    if @lowlink[v] == @indice[v]
      i = @stack.index(v)
      @scc.push(@stack[i..-1])
      @stack = @stack[0...i]
    end
  end
end
