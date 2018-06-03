class StateSimulated < State
  def go_next(context)
    tp = TreePrinter.new
    tp.is_branch    = proc { |node| node.children.any? }
    tp.get_children = proc { |node| node.children }
    tp.format_node  = proc { |node| node.to_s }
    cli.say tp.format(context.circuit)

    context.state = StateLoaded.new
  end
end
