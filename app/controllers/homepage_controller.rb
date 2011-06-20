class HomepageController < ApplicationController
  def index
    redirect_to '/twss'
  end

  def query
    @statement = params[:query][:query]
    TWSS.threshold=(1.0)
    @result = TWSS(@statement)
    render :index
  end
end
