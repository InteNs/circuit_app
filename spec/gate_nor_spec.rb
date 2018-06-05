RSpec.describe GateNor do
  subject { described_class.new }
  let(:a) { Node.new(nil) }
  let(:b) { Node.new(nil) }
  let(:ab) { Probe.new }

  before do
    subject.add_input(a)
    subject.add_input(b)
    subject.add_output(ab)
  end

  context 'and A is high' do
    before do
      a.signal = true
      b.signal = false
    end

    it 'sets output ab to low' do
      expect(ab.signal).to eq(false)
    end
  end

  context 'and input a and b are low' do
    before do
      a.signal = false
      b.signal = false
    end

    it 'sets output ab to high' do
      expect(ab.signal).to eq(true)
    end
  end

  context 'and input b is high' do
    before do
      a.signal = false
      b.signal = true
    end

    it 'sets output ab to low' do
      expect(ab.signal).to eq(false)
    end
  end

  context 'and input a and b are high' do
    before do
      a.signal = true
      b.signal = true
    end

    it 'sets output ab to low' do
      expect(ab.signal).to eq(false)
    end
  end
end
