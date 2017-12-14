require 'rails_helper'

RSpec.describe Project, type: :model do
  let(:client) { double }
  before(:each) { stub_ten_thousand_feet_client(client: client) }

  describe '#assignments' do
    it 'returns empty when there are no assignments' do
      result = Project.new.assignments(assignments: [])
      expect(result).to eq([])
    end

    it 'returns assignments that are associated with this project' do
      assignment = Assignment.new(assignable_id: 'project-id')
      result = Project.new(id: 'project-id').assignments(assignments: [assignment])
      expect(result).to eq([assignment])
    end

    context 'when there are assignments for a different project' do
      it 'returns empty when there are no assignments' do
        assignment = Assignment.new(assignable_id: 'another-project-id')
        result = Project.new(id: 'project-id').assignments(assignments: [assignment])
        expect(result).to eq([])
      end
    end
  end

  describe '#tentative?' do
    it 'returns true when it is in a tentative state' do
      result = Project.new(project_state: 'Tentative')
      expect(result.tentative?).to eq(true)
    end

    it 'returns false when it is NOT in a tentative state' do
      result = Project.new(project_state: 'Foobar')
      expect(result.tentative?).to eq(false)
    end
  end

  describe '#internal?' do
    it 'returns true when it is in a internal state' do
      result = Project.new(project_state: 'Internal')
      expect(result.internal?).to eq(true)
    end

    it 'returns false when it is NOT in a internal state' do
      result = Project.new(project_state: 'Foobar')
      expect(result.internal?).to eq(false)
    end
  end

  describe '#confirmed?' do
    it 'returns true when it is in a confirmed state' do
      result = Project.new(project_state: 'Confirmed')
      expect(result.confirmed?).to eq(true)
    end

    it 'returns false when it is NOT in a confirmed state' do
      result = Project.new(project_state: 'Foobar')
      expect(result.confirmed?).to eq(false)
    end
  end
end
