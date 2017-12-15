require 'rails_helper'

RSpec.describe AssignmentFinder, type: :service do
  describe '.call' do
    let(:client) { double }
    let(:users) { User.new(id: 123) }
    before(:each) do
      stub_ten_thousand_feet_client(client: client)
      stub_ten_thousand_feet_assignment_response(client: client)
    end

    it 'requests all assignments by default' do
      user = User.new(id: 123)

      expect(client).to receive(:get_assignments)
        .with(anything, a_hash_including(per_page: 500))

      described_class.call(users: [user])
    end

    # Sadly passing `to` and `from` to 10kft doesn't correctly filter down the response
    context 'when the assignment is not occuring between the desired date range' do
      it 'does not return it' do
        user = User.new(id: 123)
        start_date = Date.current
        end_date = (Date.current + 2)

        expect(client).to receive(:get_assignments)
          .and_return(TenThousandFeetStubs.assignment_response(starts_at: '2000-1-1', ends_at: '2000-2-2'))

        result = described_class.call(users: [user], from: start_date, to: end_date)

        expect(result.count).to eq(0)
      end
    end

    #
    # it 'requests assignments by today by default' do
    #   user = User.new(id: 123)
    #   start_date = Date.current.to_s
    #   end_date = Date.current.to_s
    #
    #   expect(client).to receive(:get_assignments)
    #     .with(anything, a_hash_including(to: today, from: today))
    #
    #   described_class.call(users: [user])
    # end
    #
    # it 'requests assignments within a date range' do
    #   user = User.new(id: 123)
    #   custom_start_date = "2017-1-1"
    #   custom_end_date = "2050-1-1"
    #
    #   expect(client).to receive(:get_assignments)
    #     .with(anything, a_hash_including(from: custom_start_date, to: custom_end_date))
    #
    #   described_class.call(users: [user], from: custom_start_date, to: custom_end_date)
    # end

    it 'gets assignments from the scheduling API for each user' do
      user_1 = User.new(id: 123)
      user_2 = User.new(id: 456)
      users = [user_1, user_2]

      expect(client).to receive(:get_assignments)
        .and_return(TenThousandFeetStubs.assignment_response(project_id: 123, user_id: user_1.id))
      expect(client).to receive(:get_assignments)
        .and_return(TenThousandFeetStubs.assignment_response(project_id: 123, user_id: user_2.id))

      result = described_class.call(users: users)

      expect(result.count).to eq(2)
      assignment_1 = result.first
      expect(assignment_1.project_id).to eq(123)
      expect(assignment_1.user_id).to eq(user_1.id)

      assignment_2 = result.second
      expect(assignment_2.project_id).to eq(123)
      expect(assignment_2.user_id).to eq(user_2.id)
    end

    context 'when there are no assignments found' do
      it 'returns an empty array' do
        user = User.new(id: 123)

        expect(client).to receive(:get_assignments)
          .and_return(TenThousandFeetStubs.empty_assignment_response)

        result = described_class.call(users: [user])

        expect(result).to eq([])
      end
    end
  end
end
