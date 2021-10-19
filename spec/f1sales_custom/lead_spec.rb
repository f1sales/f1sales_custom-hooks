require 'ostruct'

RSpec.describe F1SalesCustom::Hooks::Lead do
  let(:source_name) { 'Foobares' }
  let(:lead_object) do
    source = OpenStruct.new
    source.name = source_name
    lead = OpenStruct.new
    lead.source = source

    lead
  end

  describe '#switch_source' do
    it 'has a before create' do
      expect(described_class).to respond_to(:switch_source)
    end

    it 'returns the source name' do
      expect(described_class.switch_source(lead_object)).to eq(source_name)
    end
  end

  describe '#switch_salesman' do
    it 'has a before create' do
      expect(described_class).to respond_to(:switch_salesman)
    end

    it 'returns nil' do
      expect(described_class.switch_salesman(lead_object)).to be_nil
    end
  end
end
