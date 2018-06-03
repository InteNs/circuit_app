class StateDefault < State
  def go_next(context)
    actions = {
      import: StateImport,
      load: StateLoad
    }
    cli.say "Welcome to Logic Gate Simulator 2018!"

    cli.choose do |menu|
      menu.prompt = "Please choose an action"
      actions.each do |action, state|
        menu.choice(action) { context.state = state.new }
      end
    end
  end
end
