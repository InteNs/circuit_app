RSpec.describe GateOr do
  describe 'NAND' do
    subject { ComponentFactory.instance.get_component('NAND') }

    context 'when the gate has input A and B' do
      let(:a) { NodeLow.new }
      let(:b) { NodeLow.new }
      let(:ab) { Probe.new }

      before do
        subject.add_input(a)
        subject.add_input(b)
        subject.add_output(ab)
      end

      context 'and input a is high and b is low' do
        it 'sets output ab to low' do
          expect { a.signal = true }
          expect(ab.signal).to eq(true)
        end
      end

      context 'and input a is low and b is high' do
        it 'sets output ab to low' do
          expect { b.signal = true }
          expect(ab.signal).to eq(true)
        end
      end

      context 'and input a is low and b is low' do
        it 'sets output ab to high' do
          expect(ab.signal).to eq(true)
        end
      end

      context 'and input a is high and b is high' do
        it 'sets output ab to low' do
          expect { b.signal = true }
          expect { a.signal = true }
          expect(ab.signal).to eq(false)
        end
      end
    end
  end
end
