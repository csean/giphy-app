class TagsController < ApplicationController
  respond_to :html, :json, only: [:index, :show]
  respond_to :js, only: [:create]

  def index
    @tags = Tag.page(params[:page])
  end

  def show
    @gifs = if params[:tag]
              Tag.find_by(name: params[:name]).gifs.page(params[:page])
            else
              Tag.gifs.page(params[:page])
            end
  end

  def create
    @tag = Tag.find_or_create_by(name: params[:name])
  end
end
