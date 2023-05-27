class ListsController < ApplicationController

  def index
    @lists = List.all
    @list = List.new
  end

  def show
    @list = List.find(params[:id])
    @bookmark = Bookmark.new
  end

  def create
    @list = List.new(link_params)
    if @list.save
      raise
      redirect_to lists_path
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy
    redirect_to lists_path
  end

private

def link_params
  params.require(:list).permit(:name, :photo)
end
end
