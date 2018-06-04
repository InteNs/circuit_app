class StateLoaded < State
  def go_next(context)
    view = CircuitLoadedView.new(circuit: context.circuit)
    view.show

    view.menu("what do you want to do?") do |menu|
      menu.choice(:simulate) do
        context.state = StateSimulated.new
      end
      menu.choice(:edit) do
        context.state = StateEdit.new
      end
    end
  end
end
