class QuotesController < ApplicationController
  before_action :logged_in_user, only: [:randomizer,:new,:edit,:update]
  before_action :admin_user, only: [:delete]
  def randomizer
    @author_all = Author.all
    def select_random_author 
      @author_sample = @author_all.sample(1)
      @author_name = @author_sample[0].author_name
      @quotes_of_author =  @author_sample[0].quotes
      while @quotes_of_author.length == 0 
        select_random_author
      end
    end
      select_random_author
      @quote_sample = @author_sample[0].quotes.sample(1)
      @quote_print = @quote_sample[0].quote
  end

  def index
    
  end

  def show
  end

  def new
    @author = Author.find(params[:author_id])
    @quote = @author.quotes.build
  end

  def create
    @quote = Quote.new(quote_params)
    @quote.author_id = params[:author_id]
    @quote.tag_ids.map! {|x| x.to_i }
    #  byebug
    if @quote.save
      redirect_to author_path(@quote.author)
    else
      byebug
      render 'new'
    end
  end

  def edit
  # For some reason, the "author_id" and "id" have their values switched
    @quote = Quote.find(params[:author_id])
  end

  def update
  # For some reason, the "author_id" and "id" have their values switched
  @quote = Quote.find(params[:author_id])

  if @quote.update(params.require(:quote).permit(:quote, :author_id,tag_ids: []))
    redirect_to author_path(@quote.author)
  else
    render 'edit'
  end
  end

  def delete
  # For some reason, the "author_id" and "id" have their values switched
   @quote = Quote.find(params[:author_id])
   @quote.destroy
   redirect_to author_path
  end
   
  private
  def quote_params
    params.require(:quote).permit(:quote, :author_id, tag_ids: [])
  end
end
