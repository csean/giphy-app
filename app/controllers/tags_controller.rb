class TagsController < ApplicationController
  before_action :authenticate_user!
  respond_to :html, :json

  def show
    @tag = Tag.includes(:gifs).find_by(name: params[:name])
    @gifs = @tag.gifs.page(params[:page])
  end
end
