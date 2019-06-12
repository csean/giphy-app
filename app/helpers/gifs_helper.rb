module GifsHelper
  def giphy_thumbnail(giphy_id)
    tag.img(src: GiphyService::Client.thumbnail_url % { giphy_id: giphy_id } )
  end

  def giphy_fullsize(giphy_id)
    tag.img(src: GiphyService::Client.fullsize_url % { giphy_id: giphy_id } )
  end

  def favorite_icon(gif, user_gifs)
    klass = user_gifs.include?(gif) ? 'favorited' : nil
    fa_icon('heart', class: klass)
  end

  def link_to_previous_page(pagination)
    if pagination.offset.zero?
      'Previous Page'
    else
      link_to('#',
              class: 'search-navigation',
              data: { page: current_page(pagination) - 1 }) do
        'Previous Page'
      end
    end
  end

  def link_to_next_page(pagination)
    if pagination.offset + pagination.count >= pagination.total_count
      'Next Page'
    else
      link_to('#',
              class: 'search-navigation',
              data: { page: current_page(pagination) + 1 }) do
        'Next Page'
      end
    end
  end

  private

  def current_page(pagination)
    pagination.offset / pagination.count
  end
end
