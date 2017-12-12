require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#display_name' do
    it 'returns the external display_name' do
      result = User.new('display_name' => 'Poss Apostolou')
      expect(result.display_name).to eq('Poss Apostolou')
    end
  end

  describe '#thumbail' do
    it 'returns the external display_name' do
      result = User.new('thumbnail' => 'https://d1zljzhvpuyaiz.cloudfront.net/xxx.jpg')
      expect(result.thumbnail).to eq('https://d1zljzhvpuyaiz.cloudfront.net/xxx.jpg')
    end

    context 'when there is no thumbnail' do
      it 'return the default wall' do
        result = User.new('thumbnail' => '')
        expect(result.thumbnail).to eq('wall.jpg')
      end
    end
  end
end
