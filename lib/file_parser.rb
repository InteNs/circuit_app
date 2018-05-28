class FileParser
  attr_accessor :file_path
  attr_accessor :node_list
  attr_accessor :connection_list

  def initialize(file_path)
    self.file_path = file_path
    self.node_list = Hash.new('')
    self.connection_list = Hash.new('')
  end

  def parse
    parsing_connections = false
    File.open(file_path).each do |line|
      parsing_connections = true if blank_line?(line)
      next if line.start_with?('#') || blank_line?(line)
      if parsing_connections
        parse_connection(line)
      else
        parse_node(line)
      end
    end
    [node_list, connection_list]
  end

  def parse_node(line)
    node_name = line.split(' ')[0].tr(':', '')
    node_value = line.split(' ')[1].tr(';', '')
    node_list[node_name] = node_value
  end

  def parse_connection(line)
    main_node = line.split(' ')[0].tr(':', '')
    connected_nodes = line.split(' ')[1].tr(';', '').split(',')
    connection_list[main_node] = connected_nodes
  end

  def blank_line?(line)
    string = "#{line.chars.to_s[2]}#{line.chars.to_s[3]}"
    string == '\r'
  end
end
