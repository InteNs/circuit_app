RSpec.describe GateNand do
  subject { described_class.new }
  let(:a) { Node.new(nil) }
  let(:b) { Node.new(nil) }
  let(:ab) { Probe.new }

  before do
    subject.add_input(a)
    subject.add_input(b)
    subject.add_output(ab)
  end

  context 'when A is high and B is low' do
    before do
      a.signal = true
      b.signal = false
    end

    it 'sets output ab to low' do
      expect(ab.signal).to eq(true)
    end
  end

  context 'when A is low and B is high' do
    before do
      a.signal = false
      b.signal = true
    end

    it 'sets output AB to high' do
      expect(ab.signal).to eq(true)
    end
  end

  context 'when input a is low and b is low' do
    before do
      a.signal = true
      b.signal = false
    end

    it 'sets output AB to high' do
      expect(ab.signal).to eq(true)
    end
  end

  context 'when A is high and B is high' do
    before do
      a.signal = true
      b.signal = true
    end

    it 'sets output AB to low' do
      expect(ab.signal).to eq(false)
    end
  end
end
