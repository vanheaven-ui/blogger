class TagsController < ApplicationController
  include TagsHelper
  def show
    @tag = Tag.find(params[:id])
  end

  def index
    @tags = Tag.all
  end

  def destroy
    @tag = Tag.find(params[:id])
    @tag.destroy

    flash.notice = "Article #{@tag.name} deleted!"
    redirect_to tags_path
  end

  def edit
    @tag = Tag.find(params[:id])
  end

  def update
    @tag = Tag.find(params[:id])
    @tag.update(tag_params)

    flash.notice = "Tag #{@tag.name} amended!"

    redirect_to tags_path
  end

  def new
    @tag = Tag.new
  end

  def create
    @tag = Tag.new(tag_params)
    @tag.save

    flash.notice = "Tag #{@tag.name} created!"
    redirect_to tags_path
  end
end
