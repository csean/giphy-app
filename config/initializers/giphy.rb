# frozen_string_literal: true

GiphyService.configure do |config|
  config.api_instance = GiphyClient::DefaultApi.new
  config.api_key = Rails.application.credentials.giphy_service[:api_key]
  config.default_options = { limit: 20, rating: 'g', lang: 'en', fmt: 'json' }
  config.base_url = 'https://media.giphy.com/media/%{giphy_id}/200w.gif'
end
