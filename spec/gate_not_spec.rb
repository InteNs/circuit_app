RSpec.describe GateNot do
  subject { GateNot.new }

  context 'when the gate has input A and B' do
    let(:a) { Node.new(nil) }
    let(:b) { Probe.new }

    before do
      subject.add_input(a)
      subject.add_output(b)
    end

    context 'and input a is high' do
      before { a.signal = true }

      it 'sets output ab to low' do
        expect(b.signal).to eq(false)
      end
    end

    context 'and input a is low' do
      before { a.signal = false }

      it 'sets output ab to high' do
        expect(b.signal).to eq(true)
      end
    end
  end
end
