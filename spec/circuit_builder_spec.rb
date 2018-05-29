RSpec.describe CircuitBuilder do
  let(:node) { Node.new }
  let(:component_factory) { double('ComponentFactory', get_component: node) }
  subject { described_class.new(component_factory) }

  it 'can be initialized with a factory' do
    expect { CircuitBuilder.new(component_factory) }
      .to_not raise_error
  end

  describe '#add_component' do
    it 'adds a component to the internal components array' do
      expect { subject.add_component('test', 'OR') }
        .to change { subject.components['test'] }
        .from(nil).to(node)
    end
  end

  describe '#add_components' do
    let(:components) { { node1: 'OR', node2: 'AND' } }
    it 'adds multiple components to the internal components array' do
      expect { subject.add_components(components) }
        .to change { subject.components.count }
        .from(0).to(2)
    end
  end

  describe '#build' do
    let(:component_factory) { ComponentFactory.new }
    subject { described_class }
    it 'takes a block with build commands' do
      circuit = subject.build(component_factory) do |builder|
        builder.add_name('or gate')
        builder.add_component('A', 'INPUT_LOW')
        builder.add_component('B', 'INPUT_HIGH')
        builder.add_component('NODE1', 'OR')
        builder.add_component('AB', 'PROBE')
        builder.add_connection('A', ['NODE1'])
        builder.add_connection('B', ['NODE1'])
        builder.add_connection('NODE1', ['AB'])
      end
      expect(circuit.inputs.keys.count).to eq 2
      expect(circuit.probes.keys.count).to eq 1
      circuit.update
      expect(circuit.probes['AB'].state).to eq true
    end
  end
end
