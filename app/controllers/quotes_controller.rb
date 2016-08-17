class QuotesController < ApplicationController
  def index
    @quote = Quote.order("RANDOM()").first
  end

  def create
    @quote = Quote.new(quote_params)
    if @quote.invalid?
      flash[:error] = '<strong>Could not save</strong> the data you entered is invalid.'
    end
    if @quote.save
      redirect_to root_path
    else
      render :new
    end
  end

  def about
  end


  private

  def quote_params
    params.require(:quote).permit(:saying, :author)
  end
end
