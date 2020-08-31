class AuthorsController < ApplicationController
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
