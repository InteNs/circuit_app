RSpec.describe ComponentFactory do
  subject { described_class.new }

  describe '#get_node' do
    it 'returns a node' do
      expect(subject.get_node('OR')).to_not be_nil
    end
  end
end
