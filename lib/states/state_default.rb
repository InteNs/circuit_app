class StateDefault < State
  def go_next(context)
    actions = {
      import: StateParsed,
      load: StateLoad
    }

    view = MainView.new
    view.show

    view.menu("Please choose an action") do |menu|
      actions.each do |action, state|
        menu.choice(action) { context.state = state.new }
      end
    end
  end
end
