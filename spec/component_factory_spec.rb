RSpec.describe ComponentFactory do
  let(:component_class) { Class.new }
  subject { ComponentFactory.send(:new) }

  describe '#get_component' do
    context 'when the component is registered' do
      before do
        subject.register_component('OR', component_class)
      end

      it 'returns a component' do
        expect(subject.get_component('OR'))
          .to be_an_instance_of(component_class)
      end
    end

    context 'when the component is not registered' do
      it 'throws a KeyError' do
        expect { subject.get_component('foo') }
          .to raise_error(KeyError)
      end
    end
  end
end
