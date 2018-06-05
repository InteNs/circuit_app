class StateEdit < State
  def go_next(context)
    view = EditCircuitView.new(name: context.circuit.name)
    view.show

    view.menu("what input do you want to switch?") do |menu|
      context.circuit.nodes.each do |node|
        menu.choice(node.name) { node.switch }
      end
    end

    context.state = StateLoaded.new
  end
end
