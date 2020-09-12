class TagsController < ApplicationController

  def show
    @tag = Tag.find(params[:id])
  end

  def index
    @tags = Tag.all
  end

  def new
    @tag = Tag.new
  end

  def create
    @tag = Tag.create(tags_params)
    redirect_to tags_path
  end

  def edit
    @tag = Tag.find(params[:id])
  end

  def update
    @tag = Tag.find(params[:id])
    if @tag.update(tags_params)
    redirect_to tags_path
    else
      render 'edit'
    end
  end

  def delete
    @tag = Tag.find(params[:id])
    @tag.destroy
    redirect_to index_tag_path
  end

  private
  def tags_params
    params.require(:tag).permit(:tag_name, quote_id: [])
  end

end
