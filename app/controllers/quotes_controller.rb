class QuotesController < ApplicationController

  def randomizer
    @quote_all = Quote.all
    @quote_sample = @quote_all.sample(1)
    @quote_print = @quote_sample[0].quote
  end

  def index
    @quote = Quote.all
  end

  def show
  end

  def new
    @quote = Quote.new
  end

  def create
    @quote = Quote.new(quotes_params)
    @quote.save
    redirect_to new_quotes_path
  end

  def edit
  end

  def update
  end

  def del
   @quote = Quote.find(params[:id])
   @quote.destroy
   redirect_to quotes_path
  end

  def quotes_params
    params.require(:quote).permit(:quote)
  end
end
