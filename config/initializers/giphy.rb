# frozen_string_literal: true

GiphyService.configure do |config|
  config.api_instance = GiphyClient::DefaultApi.new
  config.api_key = Rails.application.credentials.giphy_service[:api_key]
  config.default_options = { limit: 20, rating: 'g', lang: 'en', fmt: 'json' }
  config.thumbnail_url = 'https://media.giphy.com/media/%{giphy_id}/200w.gif'
  config.fullsize_url = 'https://media0.giphy.com/media/%{giphy_id}/giphy.gif'
end
