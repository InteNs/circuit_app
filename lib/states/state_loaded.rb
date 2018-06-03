class StateLoaded < State
  def go_next(context)
    cli.say "circuit #{context.circuit.name} has been loaded"

    cli.say "the following inputs are set:"
    context.circuit.nodes.each do |node|
      cli.say "node #{node.name} -> #{node.signal}"
    end

    cli.choose do |menu|
      menu.prompt = "what do you want to do?"
      menu.choice(:simulate) do
        context.state = StateSimulated.new
      end
      menu.choice(:edit) do
        context.state = StateEdit.new
      end
    end
  end
end
