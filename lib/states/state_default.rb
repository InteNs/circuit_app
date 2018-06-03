class StateDefault < State
  def print
    "
    The following commands are available:
    import_circuit(<name>, <file_path>) - to import a circuit from a text file
    "
  end

  def go_next(context)
    context.state = StateParsed.new
  end

end
