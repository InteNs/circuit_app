RSpec.describe CircuitBuilder do
  let(:component) { Probe.new }
  let(:component_factory) do
    double('ComponentFactory', get_component: component)
  end
  let(:circuit_factory) { CircuitFactory.instance }
  subject { described_class.new(component_factory, circuit_factory) }

  describe '#add_component' do
    it 'adds a component to the internal components array' do
      expect { subject.add_component('test', 'OR') }
        .to change { subject.components['test'] }
        .from(nil).to(component)
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
    let(:or_circuit) do
      subject.build do |builder|
        builder.add_component('A', 'INPUT_LOW')
        builder.add_component('B', 'INPUT_LOW')
        builder.add_component('NODE1', 'OR')
        builder.add_component('AB', 'PROBE')
        builder.add_connection('A', ['NODE1'])
        builder.add_connection('B', ['NODE1'])
        builder.add_connection('NODE1', ['AB'])
      end
    end

    before do
    end

    let(:component_factory) { ComponentFactory.instance }
    it 'builds a simple circuit' do
      expect(or_circuit.probes['AB'].signal).to eq false
    end

    it 'builds a circuit containing circuits' do
      circuit_factory.register_prototype 'or_circuit', or_circuit
      circuit = subject.build do |builder|
        builder.add_component 'Ain',      'INPUT_LOW'
        builder.add_component 'Bin',      'INPUT_HIGH'
        builder.add_circuit   'inner_or', 'or_circuit'
        builder.add_component 'ABout',    'PROBE'

        builder.add_connection 'Ain',      ['inner_or']
        builder.add_connection 'Bin',      ['inner_or']
        builder.add_connection 'inner_or', ['ABout']
      end

      expect(circuit.probes['ABout'].signal).to eq true
    end
  end
end
