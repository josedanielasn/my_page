class QuotesController < ApplicationController

  def randomizer
    @author_all = Author.all
    @author_sample = @author_all.sample(1)
    @quote_sample = @author_sample[0].quotes.sample(1)
    @quote_print = @quote_sample[0].quote
  end

  def index
    @quote = Quote.all
  end

  def show
  end

  def new
    @author = Author.find_by(params[:author_id])
    @quote = @author.quotes.build
  end

  def create
    @quote = Quote.create(quote_params)
    redirect_to author_path(@quote.author)
  end

  def edit
    @quote = Quote.find(params[:id])
  end

  def update
    @quote = Quote.find(params[:id])

  if @quote.update(quotes_params)
    redirect_to quotes_path
  else
    render 'edit'
  end
  end

  def destroy
   @quote = Quote.find(params[:id])
   @quote.destroy
   redirect_to quotes_path
  end

  private
  def quote_params
    params.permit(:quote, :author_id)
  end
end
