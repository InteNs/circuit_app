RSpec.describe Gate do
  describe 'OR' do
    subject { ComponentFactory.instance.get_component('OR') }

    context 'when the gate has input A and B' do
      let(:a) { Connection.new }
      let(:b) { Connection.new }
      let(:ab) { Connection.new }

      before do
        subject.add_input(a)
        subject.add_input(b)
        subject.add_output(ab)
      end

      context 'and input a is high' do
        it 'sets output ab to high' do
          expect { a.state = true }
            .to change { ab.state }
            .from(false)
            .to(true)
        end
      end
    end
  end
end
