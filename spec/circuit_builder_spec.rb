RSpec.describe CircuitBuilder do
  subject { described_class.new(component_factory, circuit_factory) }
  let(:component_factory) { ComponentFactory.instance }
  let(:circuit_factory)   { CircuitFactory.instance }

  # describe '#add_component' do
  #   it 'adds a component to the internal components array' do
  #     expect { subject.add_component('test', 'OR') }
  #       .to change { subject.components['test'] }
  #       .from(nil).to(component)
  #   end
  # end

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

  describe 'print' do
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

    def print_component(component)
      if component.is_a? Node
        print " | (#{component.class})#{component.name}: #{component.signal} | "
      else
        print "(#{component.class})#{component.name}"
      end

      puts
      puts

      component.inputs.each do |input|
        if input.is_a? Node
          print " | (#{input.class})#{input.name}: #{input.signal} | "
        else
          print " | (#{input.class})#{input.name} | "
        end

        puts
        puts

        input.inputs.each do |input|
          if input.is_a? Node
            print " | (#{input.class})#{input.name}: #{input.signal} | "
          else
            print " | (#{input.class})#{input.name} | "
          end
        end
      end
    end

    it 'prints a circuit' do
      or_circuit.probes.each do |p|
        print_component(p)
      end

      require 'pry'
      binding.pry
    end
  end
end
