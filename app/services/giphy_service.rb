# frozen_string_literal: true

module GiphyService
  def self.configure
    yield Client
  end

  class Client
    class << self
      attr_accessor :api_instance, :api_key, :default_options, :base_url

      def trending(**options)
        api_instance.gifs_trending_get(api_key, default_options.merge(options))
      rescue GiphyClient::ApiError => e
        Rails.logger.error("Error getting trending gifs: #{e.message}")
        nil
      end

      def random(tag: '')
        tag = Rack::Utils.escape(tag)
        api_instance.gifs_random_get(api_key, default_options.merge(tag: tag))
      rescue GiphyClient::ApiError => e
        Rails.logger.error("Error getting random gifs - #{tag}: #{e.message}")
        nil
      end

      def search(query, offset: 0, **options)
        query = Rack::Utils.escape(query)
        opts = default_options.merge(offset: offset)
        api_instance.gifs_search_get(api_key, query, opts.merge(options))
      rescue GiphyClient::ApiError => e
        Rails.logger.error("Error using search - #{query}: #{e.message}")
        nil
      end

      def by_id(id)
        api_instance.gifs_gif_id_get(api_key, id)
      rescue GiphyClient::ApiError => e
        Rails.logger.error("Error getting gif - #{id}: #{e.message}")
        nil
      end

      def by_ids(ids)
        ids = ids.join(',') if ids.is_a?(Array)

        api_instance.gifs_get(api_key, ids)
      rescue GiphyClient::ApiError => e
        Rails.logger.error("Error getting gifs - #{ids}: #{e.message}")
        nil
      end
    end
  end
end
