RSpec.describe FileParser do
  let(:file_parser) { FileParser.new('spec/fixtures/Circuit1_FullAdder.txt') }
  let(:parsed_map) { file_parser.parse }
  let(:node_line) { 'NODE1:	OR;' }
  let(:node_line_parsed) { file_parser.parse_node(node_line)}
  let(:connection_line) { 'NODE2:	NODE4,NODE6;' }
  let(:connection_line_parsed) { file_parser.parse_connection(connection_line)}
  it 'parses a circuit file' do
    expect(parsed_map[0]).to eq(
                               {"A"=>"INPUT_HIGH", "B"=>"INPUT_HIGH", "Cin"=>"INPUT_LOW", "Cout"=>"PROBE", "S"=>"PROBE", "NODE1"=>"OR", "NODE2"=>"AND", "NODE3"=>"AND", "NODE4"=>"NOT", "NODE5"=>"AND", "NODE6"=>"OR", "NODE7"=>"NOT", "NODE8"=>"NOT", "NODE9"=>"AND", "NODE10"=>"AND", "NODE11"=>"OR"}
                             )
    expect(parsed_map[1]).to eq(
                               {"Cin"=>["NODE3", "NODE7", "NODE10"], "A"=>["NODE1", "NODE2"], "B"=>["NODE1", "NODE2"], "NODE1"=>["NODE3", "NODE5"], "NODE2"=>["NODE4", "NODE6"], "NODE3"=>["NODE6"], "NODE4"=>["NODE5"], "NODE5"=>["NODE8", "NODE9"], "NODE6"=>["Cout"], "NODE7"=>["NODE9"], "NODE8"=>["NODE10"], "NODE9"=>["NODE11"], "NODE10"=>["NODE11"], "NODE11"=>["S"]})
  end
  it 'parses a node line' do
    expect(node_line_parsed).to eq({'NODE1' => 'OR'})
  end

  it 'parses a connection line' do
    expect(connection_line_parsed).to eq({"NODE2" => ["NODE4","NODE6"]})
  end

end

