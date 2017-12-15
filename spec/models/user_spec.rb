require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#thumbail' do
    it 'returns the external display_name' do
      result = User.new('thumbnail' => 'https://d1zljzhvpuyaiz.cloudfront.net/xxx.jpg')
      expect(result.thumbnail).to eq('https://d1zljzhvpuyaiz.cloudfront.net/xxx.jpg')
    end

    context 'when there is no thumbnail' do
      it 'return the default wall' do
        result = User.new('thumbnail' => '')
        expect(result.thumbnail).to eq('anon.jpg')
      end
    end
  end
end
