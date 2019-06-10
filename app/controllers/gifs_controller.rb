class GifsController < ApplicationController
  respond_to :html, :json, except: [:search, :favorite]
  respond_to :js

  def index
    @gifs = current_user.gifs.page(params[:page])
  end

  def search
    # hardcoded 25 per page in interest of time
    offset = params[:page].to_i * 20
    result = GiphyService::Client.search(params[:query], offset: offset)
    @gifs = result.data
    @user_gifs = current_user.gifs.where(giphy_id: @gifs.map(&:id)).pluck(:giphy_id)
    @pagination = result.pagination
  end

  def favorite
    gif = Gif.find_or_create_by(giphy_id: params[:giphy_id])
    Favorite.toggle_favorite(current_user, gif)
    @gifs = current_user.gifs.page(0)
  end
end
