require 'rails_helper'

RSpec.describe ProjectFinder, type: :service do
  describe '.call' do
    let(:client) { double }
    before(:each) do
      stub_ten_thousand_feet_client(client: client)
      allow(client).to receive(:get_projects).and_return([])
    end

    it 'gets projects from the scheduling API' do
      expect(client).to receive(:get_projects).and_return(TenThousandFeet::PROJECT_RESPONSE)

      result = described_class.call
      project = result.first

      expect(project.id).to eq(1724065)
      expect(project.name).to eq('Essex')
    end

    context 'when there are no projects found' do
      it 'returns an empty array' do
        allow(client).to receive(:get_projects).and_return(TenThousandFeet::EMPTY_PROJECT_RESPONSE)

        result = described_class.call

        expect(result).to eq([])
      end
    end
  end
end
