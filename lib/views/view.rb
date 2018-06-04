class View
  attr_accessor :cli

  def initialize(*)
    @cli = HighLine.new
  end

  def show
    raise 'implement in sub class'
  end

  def info(string)
    cli.say "-> #{string}".colorize(color: :light_blue)
  end

  def success(string)
    cli.say "-> #{string}".colorize(color: :light_green)
  end

  def error(string)
    cli.say "!> #{string}".colorize(color: :light_red)
  end

  def ask(string)
    cli.ask "?> #{string}  ".colorize(color: :magenta)
  end

  def say(string)
    cli.say string
  end

  def menu(prompt)
    cli.choose do |menu|
      menu.prompt = "?> #{prompt}".colorize(color: :magenta)
      yield menu
    end
  end
end
