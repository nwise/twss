class HomepageController < ApplicationController
  def index
    render :index
  end

  def query
    @statement = params[:query][:query]
    TWSS.threshold=(1.0)
    @result = TWSS(@statement)
    render :index
  end
end
