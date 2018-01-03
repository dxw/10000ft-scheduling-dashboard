require 'rails_helper'

RSpec.describe SchedulesHelper, type: :helper do
  describe 'project_classes' do
    it 'returns the project name' do
      project = Project.new(name: 'foo bar')
      result = project_classes(project: project)
      expect(result).to eq('foo-bar')
    end

    context 'when the project is internal' do
      it 'adds the internal class' do
        project = Project.new(name: 'foo-bar', project_state: 'internal')
        result = project_classes(project: project)
        expect(result).to eq('foo-bar internal')
      end
    end

    context 'when the project is confirmed' do
      it 'adds the confirmed class' do
        project = Project.new(name: 'foo-bar', project_state: 'confirmed')
        result = project_classes(project: project)
        expect(result).to eq('foo-bar confirmed')
      end
    end

    context 'when the project is oncall' do
      it 'adds the oncall class' do
        project = Project.new(name: 'on call')
        result = project_classes(project: project)
        expect(result).to eq('on-call oncall')
      end
    end

    context 'when the project is of type leave' do
      it 'adds the leave class' do
        project = Project.new(name: 'sick', project_state: 'leave')
        result = project_classes(project: project)
        expect(result).to eq('sick leave')
      end
    end
  end

  describe 'nickname' do
    context 'when the user ID is NOT on our whitelist' do
      it 'returns their first name' do
        user = User.new(id: 123, first_name: 'foo')
        result = nickname(user: user)
        expect(result).to eq('foo')
      end
    end

    context 'when the user ID is on our whitelist' do
      it 'returns the nickname instead of their first name' do
        user = User.new(id: 387517, first_name: 'foo')
        result = nickname(user: user)
        expect(result).to eq('hippers')
      end
    end
  end
end
