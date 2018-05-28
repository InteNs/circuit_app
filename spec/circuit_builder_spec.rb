RSpec.describe CircuitBuilder do
  let(:node_factory) { double('NodeFactory') }
  subject { described_class.new(node_factory) }

  it 'can be initialized with a factory' do
    expect { CircuitBuilder.new(node_factory) }
      .to_not raise_error
  end

  describe '#insert_node' do
    before do
      allow(node_factory).to receive(:get_node).with('OR').and_return('node')
    end

    it 'adds a node to the internal node array' do
      expect { subject.insert_node('test', 'OR') }
        .to change { subject.nodes['test'] }
        .from(nil).to('node')
    end
  end
end
