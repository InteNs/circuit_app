RSpec.describe GateNot do
  describe 'NOT' do
    subject { ComponentFactory.instance.get_component('NOT') }

    context 'when the gate has input A and B' do
      let(:a) { NodeLow.new }

      before do
        subject.add_input(a)
      end

      context 'and input a is high' do
        it 'sets output ab to low' do
          expect { a.signal = true }
          expect(a.signal).to eq(false)
        end
      end

      context 'and input a is low' do
        it 'sets output ab to high' do
          expect { a.signal = false }
          expect(a.signal).to eq(true)
        end
      end
    end
  end
end
