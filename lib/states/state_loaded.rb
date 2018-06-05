class StateLoaded < State
  def go_next(context)
    view = CircuitLoadedView.new(circuit: context.circuit)
    view.show

    view.menu("what do you want to do?") do |menu|
      menu.choice(:simulate) { context.state = StateSimulated.new }
      menu.choice(:edit) { context.state = StateEdit.new }
      menu.choice(:save) { context.state = StateSaved.new }
      menu.choice(:main) { context.state = StateDefault.new }
    end
  end
end
