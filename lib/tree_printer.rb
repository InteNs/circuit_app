class TreePrinter
  attr_accessor :is_branch
  attr_accessor :get_children
  attr_accessor :format_node
  attr_accessor :skip_root_node

  def initialize
    @arms = Hash.new("|   ")
    @arms[""]  = ""
    @arms["`"] = "    "
    @out = ""
    @is_branch    = proc { |node| node.children.any? }
    @get_children = proc { |node| node.children }
    @format_node  = proc { |node| node.to_s }
    @skip_root_node = false
  end

  def visit(_path, leader, tie, arm, node)
    if (@root == node) && skip_root_node
      # skip
    else
      node_str = @format_node.call(node)
      @out << "#{leader}|\n"
      @out << "#{leader}#{arm}#{tie}#{node_str}\n"
    end
    visit_children(node, leader + @arms[arm])
    @out
  end

  def visit_children(path, leader)
    kids = []
    if (@root == path) && skip_root_node
      kids = path
    else
      return unless @is_branch.call(path)
      kids = @get_children.call(path)
    end
    return if kids.empty?
    arms = Array.new(kids.length - 1, "|") << "`"
    pairs = kids.zip(arms)
    pairs.each { |e| visit(path, leader, "-- ", e[1], e[0]) }
  end

  def format(root)
    @root = root
    visit root, "", "", "", root
  end
end
