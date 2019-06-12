class GifsController < ApplicationController
  before_action :authenticate_user!
  respond_to :html, :json, except: [:favorite]
  respond_to :js

  def index
    @gifs = current_user.gifs.page(params[:page])
  end

  def show
    @gif = Gif.find_by(giphy_id: params[:giphy_id])
  end

  def update
    @gif = Gif.find_by(giphy_id: params[:giphy_id])
    @gif.associate_tags(gif_params[:tag_ids])
    respond_with(@gif)
  end

  def search
    # hardcoded 25 per page in interest of time
    offset = params[:page].to_i * 20
    result = if params[:query].present?
               GiphyService::Client.search(params[:query], offset: offset)
             else
               GiphyService::Client.trending
             end

    @gifs = result.data
    @user_gifs = current_user.gifs.where(giphy_id: @gifs.map(&:id)).pluck(:giphy_id)
    @pagination = result.pagination
  end

  def favorite
    gif = Gif.find_or_create_by(giphy_id: params[:giphy_id])
    Favorite.toggle_favorite(current_user, gif)
    @gifs = current_user.gifs.page(0)
  end

  private

  def gif_params
    params.require(:gif).permit(tag_ids: [])
  end
end
