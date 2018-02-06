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

    context 'when the project is tentative' do
      it 'adds the tentative class' do
        project = Project.new(name: 'foo-bar', project_state: 'tentative')
        result = project_classes(project: project)
        expect(result).to eq('foo-bar tentative')
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

  describe 'display_tags' do
    context 'when the user has NO tags' do
      it 'returns nil' do
        user = OpenStruct.new(tags: [])
        result = display_tags(user: user)
        expect(result).to eq('')
      end
    end

    context 'when the user DOES have a tag' do
      it 'returns the tag as a lower case string' do
        user = OpenStruct.new(tags: ['contractor'])
        result = display_tags(user: user)
        expect(result).to eq('contractor')
      end
    end

    context 'when the user has multiple tags' do
      it 'returns them all as a joined list of ' do
        user = OpenStruct.new(tags: ['contractor', 'rails'])
        result = display_tags(user: user)
        expect(result).to eq('contractor, rails')
      end
    end
  end

  describe 'project_description' do
    it 'returns the name of the project' do
      result = project_description(project: Project.new(name: 'foo'))
      expect(result).to eq('foo')
    end

    context 'when the project is a phase (child project)' do
      it 'returns both name and child name' do
        result = project_description(project: Project.new(name: 'baz', phase_name: 'bar'))
        expect(result).to eq('baz - bar')
      end
    end
  end
end
