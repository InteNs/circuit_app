RSpec.describe GateXor do
  describe 'XOR' do
    subject { ComponentFactory.instance.get_component('XOR') }

    context 'when the gate has input A and B' do
      let(:a) { NodeLow.new }
      let(:b) { NodeLow.new }
      let(:ab) { Probe.new }

      before do
        subject.add_input(a)
        subject.add_input(b)
        subject.add_output(ab)
      end

      context 'and input a is high' do
        it 'sets output ab to low' do
          expect { a.signal = true }
          expect(ab.signal).to eq(true)
        end
      end

      context 'and input a and b are low' do
        it 'sets output ab to high' do
          expect { a.signal = false }
          expect { b.signal = false }
          expect(ab.signal).to eq(false)
        end
      end

      context 'and input b is high' do
        it 'sets output ab to low' do
          expect { a.signal = false }
          expect { b.signal = true }
            .to change { ab.signal }
                  .from(false)
                  .to(true)
        end
      end

      context 'and input a and b are high' do
        it 'sets output ab to low' do
          expect { b.signal = true }
          expect { a.signal = true }
          expect(ab.signal).to eq(false)

        end
      end
    end
  end
end
