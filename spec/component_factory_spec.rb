RSpec.describe ComponentFactory do
  subject { described_class.new }

  describe '#get_component' do
    it 'returns a component' do
      expect(subject.get_component('OR'))
    end
  end
end
