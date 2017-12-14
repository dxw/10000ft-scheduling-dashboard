require 'rails_helper'

RSpec.describe TodayScheduleFacade, type: :facade do
  let(:client) { double }

  describe '#projects' do
    it 'returns Project objects' do
      project = Project.new
      expect(ProjectFinder).to receive(:call).and_return([project])

      result = described_class.new.projects

      expect(result.count).to eq(1)
      expect(result.first).to eq(project)
    end
  end

  describe '#todays_assignments' do
    it 'returns Assignment objects' do
      users = double
      expect(UserFinder).to receive(:call).and_return(users)

      assignment = Assignment.new
      expect(AssignmentFinder).to receive(:call)
        .with(a_hash_including(users: users))
        .and_return([assignment])

      result = described_class.new.todays_assignments

      expect(result.count).to eq(1)
      expect(result.first).to eq(assignment)
    end
  end

  describe '#users' do
    it 'returns User objects' do
      user = User.new
      expect(UserFinder).to receive(:call).and_return([user])

      result = described_class.new.users

      expect(result.count).to eq(1)
      expect(result.first).to eq(user)
    end
  end

  describe '#leave_types' do
    it 'returns LeaveType objects' do
      leave_type = LeaveType.new
      expect(LeaveTypeFinder).to receive(:call).and_return([leave_type])

      result = described_class.new.leave_types

      expect(result.count).to eq(1)
      expect(result.first).to eq(leave_type)
    end
  end

  describe '#holiday_assignments' do
    it 'returns only the assignments for the holiday leave type' do
      holiday_leave_type = LeaveType.new(id: 123, name: 'Holiday')
      allow(LeaveTypeFinder).to receive(:call).and_return([holiday_leave_type])

      holiday_assignment = Assignment.new(project_id: 123)
      stub_assignment_finder(assignments: [holiday_assignment])

      result = described_class.new.holiday_assignments

      expect(result.count).to eq(1)
      expect(result.first).to eq(holiday_assignment)
    end

    context 'when there is no leave type' do
      it 'returns an empty array' do
        allow(LeaveTypeFinder).to receive(:call).and_return([])

        result = described_class.new.holiday_assignments

        expect(result).to eq([])
      end
    end

    context 'when there are no assignments to holiday' do
      it 'returns an empty array' do
        holiday_leave_type = LeaveType.new(id: 123, name: 'Holiday')
        allow(LeaveTypeFinder).to receive(:call).and_return([holiday_leave_type])
        stub_assignment_finder(assignments: [])

        result = described_class.new.holiday_assignments

        expect(result).to eq([])
      end
    end
  end

  describe '#sick_assignments' do
    it 'returns only the assignments for the holiday leave type' do
      sick_leave_type = LeaveType.new(id: 123, name: 'Sick')
      allow(LeaveTypeFinder).to receive(:call).and_return([sick_leave_type])

      sick_assignment = Assignment.new(project_id: 123)
      stub_assignment_finder(assignments: [sick_assignment])

      result = described_class.new.sick_assignments

      expect(result.count).to eq(1)
      expect(result.first).to eq(sick_assignment)
    end

    context 'when there is no leave type' do
      it 'returns an empty array' do
        allow(LeaveTypeFinder).to receive(:call).and_return([])

        result = described_class.new.sick_assignments

        expect(result).to eq([])
      end
    end

    context 'when there are no assignments to holiday' do
      it 'returns an empty array' do
        sick_leave_type = LeaveType.new(id: 123, name: 'Sick')
        allow(LeaveTypeFinder).to receive(:call).and_return([sick_leave_type])
        stub_assignment_finder(assignments: [])

        result = described_class.new.sick_assignments

        expect(result).to eq([])
      end
    end
  end

  describe '#users_without_assignments' do
    it 'returns User objects that do NOT have an assignment' do
      user_without_assignment = User.new(id: 456)
      user_with_assignment = User.new(id: 789)
      allow(UserFinder).to receive(:call)
        .and_return([user_without_assignment, user_with_assignment])

      assignment = Assignment.new(project_id: 123, user_id: 789)
      allow(AssignmentFinder).to receive(:call).and_return([assignment])

      result = described_class.new.users_without_assignments

      expect(result.count).to eq(1)
      expect(result.first.id).to eq(456)
    end

    context 'when all users are assigned' do
      it 'returns an empty array' do
        user_with_assignment = User.new(id: 789)
        allow(UserFinder).to receive(:call).and_return([user_with_assignment])

        assignment = Assignment.new(project_id: 123, user_id: 789)
        allow(AssignmentFinder).to receive(:call).and_return([assignment])

        result = described_class.new.users_without_assignments

        expect(result).to eq([])
      end
    end
  end

  def stub_assignment_finder(assignments: [])
    allow(AssignmentFinder).to receive(:call).and_return(assignments)
    allow(UserFinder).to receive(:call).and_return([])
  end
end
