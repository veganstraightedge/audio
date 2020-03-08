class QuotesController < ApplicationController
  before_filter :login_required

  def index
    @quotes = Quote.all
  end

  def show
    @quote = Quote.find(params[:id])
  end

  def new
    @quote = Quote.new
  end

  def edit
    @quote = Quote.find(params[:id])
  end

  def create
    @quote = Quote.new(params[:quote])

    if @quote.save
      flash[:notice] = 'Quote was successfully created.'
      redirect_to @quote
    else
      render :action => "new"
    end
  end

  def update
    @quote = Quote.find(params[:id])

    if @quote.update_attributes(params[:quote])
      flash[:notice] = 'Quote was successfully updated.'
      redirect_to @quote
    else
      render :action => "edit"
    end
  end

  def destroy
    @quote = Quote.find(params[:id])
    @quote.destroy
    redirect_to quotes_path
  end
end
