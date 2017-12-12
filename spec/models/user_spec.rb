require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#display_name' do
    it 'returns the external display_name' do
      result = User.new('display_name' => 'Poss Apostolou')
      expect(result.display_name).to eq('Poss Apostolou')
    end
  end
end
