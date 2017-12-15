require 'rails_helper'

RSpec.describe TenThousandFeetWrapper do
  describe '.client' do
    it 'returns a TenThousandFeetStubs client object' do
      ENV['SCHEDULING_API_KEY'] = '123abc'

      result = described_class.client
      expect(result).to be_kind_of(TenThousandFeet::Client)

      ENV['SCHEDULING_API_KEY'] = nil
    end

    context 'when there is no API key in ENV' do
      before(:each) { ENV['SCHEDULING_API_KEY'] = nil }
      it 'raises an error' do
        expect{ described_class.client }.to raise_error(ArgumentError)
      end
    end
  end
end
