require 'singleton'
require 'deep_clone'

class CircuitFactory
  include Singleton

  attr_accessor :circuit_prototypes

  def initialize
    @circuit_prototypes = {}
  end

  def register_prototype(name, circuit)
    circuit_prototypes[name] = circuit
  end

  def get_circuit(name)
    prototype = circuit_prototypes.fetch(name)
    DeepClone.clone(prototype)
  end
end
