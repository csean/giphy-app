require 'rails_helper'

describe GiphyService::Client do
  subject(:client) { GiphyService::Client }

  describe 'trending' do
    it 'has an appropriate class' do
      expect(client.trending).to be_a GiphyClient::InlineResponse200
    end
  end

  describe 'random' do
    it 'has an appropriate class' do
      expect(client.random).to be_a GiphyClient::InlineResponse2002
    end
  end

  describe 'search' do
    it 'has an appropriate class' do
      expect(client.search('cheeseburgers')).to be_a GiphyClient::InlineResponse200
    end

    it 'has a changeable offset' do
      result = client.search('cheeseburgers', offset: 10)
      expect(result.pagination.offset).to eq 10
    end
  end

  describe 'by_id' do
    it 'has an appropriate class' do
      expect(client.by_id('26njPmXyeB1kCAauk')).to be_a GiphyClient::InlineResponse2001
    end

    it 'returns nil if gif cannot be found' do
      expect(client.by_id('26njPmXyeB1kCAauk-dfgdfdfdf')).to be_nil
    end
  end

  describe 'by_ids' do
    it 'has an appropriate class' do
      expect(client.by_ids('26njPmXyeB1kCAauk')).to be_a GiphyClient::InlineResponse200
    end

    it 'returns nil if gif cannot be found' do
      expect(client.by_ids('26njPmXyeB1kCAauk-dfgdfdfdf')).to be_nil
    end
  end

end
