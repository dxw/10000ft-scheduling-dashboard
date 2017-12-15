require 'rails_helper'

RSpec.describe LeaveTypeFinder, type: :service do
  describe '.call' do
    let(:client) { double }
    before(:each) do
      stub_ten_thousand_feet_client(client: client)
      stub_ten_thousand_feet_leave_types_response(client: client)
    end

    it 'requests all leave types by default' do
      expect(client).to receive(:get_leave_types).with(per_page: 500)
      described_class.call
    end

    it 'gets leave types from the scheduling API' do
      expect(client).to receive(:get_leave_types)
        .and_return(TenThousandFeetStubs.leave_types_response(project_id: 123, name: 'Sick'))

      result = described_class.call

      expect(result.count).to eq(1)
      leave_type = result.first
      expect(leave_type.id).to eq(123)
      expect(leave_type.name).to eq('Sick')
    end

    context 'when there are no leave types found' do
      it 'returns an empty array' do
        expect(client).to receive(:get_leave_types)
          .and_return(TenThousandFeetStubs.empty_leave_types_response)

        result = described_class.call

        expect(result).to eq([])
      end
    end
  end
end
