require 'rails_helper'

RSpec.describe ProjectFinder, type: :service do
  describe '.call' do
    let(:client) { double }
    before(:each) do
      stub_ten_thousand_feet_client(client: client)
      stub_ten_thousand_feet_project_response(client: client)
    end

    it 'requests all projects by default' do
      expect(client).to receive(:get_projects).with(per_page: 500)
      described_class.call
    end

    it 'gets projects from the scheduling API' do
      expect(client).to receive(:get_projects).and_return(TenThousandFeet.project_response(project_id: 1724065, name: 'Essex'))

      result = described_class.call

      expect(result.count).to eq(1)
      project = result.first
      expect(project.id).to eq(1724065)
      expect(project.name).to eq('Essex')
    end

    context 'when there are no projects found' do
      it 'returns an empty array' do
        allow(client).to receive(:get_projects).and_return(TenThousandFeet.empty_project_response)

        result = described_class.call

        expect(result).to eq([])
      end
    end
  end
end
