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
        expect(result.thumbnail).to eq('anon.png')
      end
    end
  end

  describe 'tags' do
    context 'when the user has a tag' do
      it 'returns an array with the tag as the only element' do
        result = User.new(tags: { 'data' => [{ 'value' => 'Contractor' }] })
        expect(result.tags).to eq(['contractor'])
      end
    end

    context 'when the user has multiple tags' do
      it 'returns an array with each tag as an element' do
        result = User.new(tags: { 'data' => [{ 'value' => 'Contractor' }, { 'value' => 'Rails' }] })
        expect(result.tags).to eq(['contractor', 'rails'])
      end
    end

    context 'when the user has no tags' do
      it 'returns an empty array' do
        result = User.new(tags: { 'data' => [] })
        expect(result.tags).to eq([])
      end
    end
  end

  describe '#blacklisted?' do
    context 'when the tag is "hide-from-dashboard"' do
      it 'returns true' do
        user = User.new(tags: { 'data' => [{ 'value' => 'hide-from-dashboard' }] })
        result = user.blacklisted?
        expect(result).to eq(true)
      end
    end

    context 'when the tag is "unbillable"' do
      it 'returns true' do
        user = User.new(tags: { 'data' => [{ 'value' => 'unbillable' }] })
        result = user.blacklisted?
        expect(result).to eq(true)
      end
    end

    context 'when the tag is "cyber"' do
      it 'returns true' do
        user = User.new(tags: { 'data' => [{ 'value' => 'cyber' }] })
        result = user.blacklisted?
        expect(result).to eq(true)
      end
    end
  end
end
