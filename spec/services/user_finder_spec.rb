require 'rails_helper'

RSpec.describe UserFinder, type: :service do
  describe '.call' do
    let(:client) { double }
    before(:each) do
      stub_ten_thousand_feet_client(client: client)
      stub_ten_thousand_feet_user_response(client: client)
    end

    it 'requests all users by default' do
      expect(client).to receive(:get_users).with(per_page: 500, fields: 'tags')
      described_class.call
    end

    it 'gets users from the scheduling API' do
      expect(client).to receive(:get_users)
        .and_return(TenThousandFeetStubs.user_response(user_id: 123, first_name: 'Sick'))

      result = described_class.call

      expect(result.count).to eq(1)
      user = result.first
      expect(user.id).to eq(123)
      expect(user.first_name).to eq('Sick')
    end

    context 'when there are no leave types found' do
      it 'returns an empty array' do
        expect(client).to receive(:get_users)
          .and_return(TenThousandFeetStubs.empty_user_response)

        result = described_class.call

        expect(result).to eq([])
      end
    end

    context 'when a user is blacklisted' do
      it 'does not return it' do
        expect(client).to receive(:get_users)
          .and_return(TenThousandFeetStubs.user_response_with_tags(tags: ['hide-from-dashboard']))

        result = described_class.call

        expect(result).to eq([])
      end
    end
  end
end
