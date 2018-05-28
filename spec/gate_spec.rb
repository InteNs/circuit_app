RSpec.describe Gate do
  describe 'OR' do
    subject { ComponentFactory.new.get_component('OR') }

    context 'when the gate has 2 inputs' do
      let(:a) { Connection.new }
      let(:b) { Connection.new }
      let(:ab) { Connection.new }

      before do
        subject.add_input(a)
        subject.add_input(b)
        subject.add_output(ab)
      end

      it 'outputs high' do
        a.state = ConnectionStateHigh
        expect(subject.outputs.first.state)
          .to eq ConnectionStateHigh
      end
    end
  end
end
