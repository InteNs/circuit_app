RSpec.describe GateAnd do
  describe 'AND' do
    subject { ComponentFactory.instance.get_component('AND') }

    context 'when the gate has input A and B' do
      let(:a) { NodeHigh.new }
      let(:b) { NodeHigh.new }
      let(:ab) { Probe.new }

      before do
        subject.add_input(a)
        subject.add_input(b)
        subject.add_output(ab)
      end

      context 'and input a and b are high' do
        it 'sets output ab to high' do
          expect(ab.signal).to eq(true)
        end
      end

      context 'and input a is high and b is low' do
        it 'sets output ab to low' do
          expect { b.signal = false }
            .to change { ab.signal }
                  .from(true).to(false)
        end
      end

      context 'and input b is high and a is low' do
        it 'sets output ab to low' do
          expect { a.signal = false}
            .to change { ab.signal }
                  .from(true)
                  .to(false)
        end
      end

      context 'and input a is low and b is low' do
        it 'sets output ab to low' do
          expect { a.signal = false}
          expect { b.signal = false}
          .to change { ab.signal }
                  .from(true)
                  .to(false)
        end
      end

    end
  end
end
