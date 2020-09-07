class AuthorsController < ApplicationController
  before_action :logged_in_user, only: [:edit,:update]
  before_action :admin_user, only: [:delete]
  def new
    
  end
  
  def create
    @author = Author.new(author_params)
    @author.save
    redirect_to @author
  end

  def show
    @author = Author.find(params[:id])
    @quotes = @author.quotes
  end

  def index
    @authors = Author.all
  end

  def  edit
    @author = Author.find(params[:id])
  end

  def update
    @author = Author.find(params[:id])
    if @author.update(author_params)
      redirect_to authors_path(@author)
    else
      render 'edit'
    end
  end

  def destroy
    @author = Author.find(params[:id])
    @author.quotes.delete_all 
    @author.destroy
    redirect_to authors_path
  end

  private

  def author_params
   params.require(:author).permit(:author_name)
  end

end
