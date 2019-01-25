require 'rails_helper'

RSpec.describe TenkftClient do
  context 'when the username is missing from the ENV' do
    before(:each) { ENV['TENKFT_USERNAME'] = nil }

    it 'raises an error' do
      expect{ described_class.new }.to raise_error(ArgumentError)
    end
  end

  context 'when the password is missing from the ENV' do
    before(:each) { ENV['TENKFT_PASSWORD'] = nil }

    it 'raises an error' do
      expect{ described_class.new }.to raise_error(ArgumentError)
    end
  end
end
