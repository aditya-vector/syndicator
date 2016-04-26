require 'rails_helper'

describe Feed do
  context 'with valid location' do
    it 'builds a valid record' do
      feed = Feed.new(location: Faker::Internet.url)
      expect(feed).to be_valid
    end
  end

  context 'with invalid attributes' do
    it 'does not allow invalid location' do
      feed = Feed.new(location: Faker::Lorem.word)
      expect(feed).to be_invalid
    end
  end

  describe '#details' do
    context 'with valid location' do
      feed = Feed.create(location: VALID_RSS_URL)
      subject(:details) { feed.details }
      it 'should have valid channel and title' do
        expect(details).to respond_to(:channel, :items)
      end
    end

    context 'with invalid location' do
      feed = Feed.create!(location: Faker::Internet.url)
      subject(:details) { feed.details }
      it 'should return an error message' do
        expect(details.error).not_to be_blank
      end
    end
  end
end
