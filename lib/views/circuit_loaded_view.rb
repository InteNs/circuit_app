class CircuitLoadedView < View
  def initialize(circuit:)
    @circuit = circuit
    super
  end

  def show
    info "-----------------------"
    info "[name]"
    info "    #{@circuit.name}"
    info "[delay]"
    info "    #{@circuit.propagation_delay} nanoseconds"

    info "[inputs]"
    @circuit.nodes.each do |node|
      info "    #{node.name} -> #{node.signal}"
    end
    info "[probes]"
    @circuit.probes.each do |probe|
      info "    #{probe.name} -> #{probe.signal}"
    end
    info "-----------------------"
  end
end
