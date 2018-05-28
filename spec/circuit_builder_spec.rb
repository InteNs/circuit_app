RSpec.describe CircuitBuilder do
  let(:node_factory) { double('NodeFactory', get_node: 'node') }
  subject { described_class.new(node_factory) }

  it 'can be initialized with a factory' do
    expect { CircuitBuilder.new(node_factory) }
      .to_not raise_error
  end

  describe '#insert_node' do
    it 'adds a node to the internal nodes array' do
      expect { subject.insert_node('test', 'OR') }
        .to change { subject.nodes['test'] }
        .from(nil).to('node')
    end
  end

  describe '#insert_nodes' do
    let(:nodes) { { node1: 'OR', node2: 'AND' } }
    it 'adds multiple nodes to the internal nodes array' do
      expect { subject.insert_nodes(nodes) }
        .to change { subject.nodes.count }
        .from(0).to(2)
    end
  end

  describe 'temp' do
    it 'is temp' do
      circuit = subject.build do |builder|
        builder.add_component('A', 'INPUT_LOW')
        builder.add_component('B', 'INPUT_HIGH')
        builder.add_component('NODE1', 'OR')
        builder.add_component('AB', 'PROBE')
        builder.add_connection('A', ['NODE1'])
        builder.add_connection('B', ['NODE1'])
        builder.add_connection('NODE1', ['AB'])
      end
    end
  end
end
