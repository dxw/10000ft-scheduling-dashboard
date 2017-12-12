require 'rails_helper'

RSpec.describe Project, type: :model do
  describe '#users' do
    let(:client) { double }
    before(:each) { stub_ten_thousand_feet_client(client: client) }

    it 'gets users for this project from the scheduling API' do
      project_id = 1724065
      expect(client).to receive(:get_project_users)
        .with(project_id)
        .and_return(user_response)

      result = Project.new("id"=> project_id).users
      user = result.first

      expect(user.display_name).to eq('Poss Apostolou')
    end

    context 'when no users were found' do
      it 'returns an empty array' do
        project_id = 1724065
        expect(client).to receive(:get_project_users)
          .with(project_id)
          .and_return(empty_user_response)

        result = Project.new("id"=> project_id).users
        expect(result).to eq([])
      end
    end
  end

  describe '#id' do
    it 'returns the external ID' do
      result = Project.new('id' => 132456)
      expect(result.id).to eq(132456)
    end
  end

  describe '#name' do
    it 'returns the external name' do
      result = Project.new('name' => 'Essex')
      expect(result.name).to eq('Essex')
    end
  end
end
