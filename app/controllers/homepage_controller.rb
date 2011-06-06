class HomepageController < ApplicationController
  def index
    render :index
  end

  def query
    @statement = params[:query][:query]
    @result = TWSS(@statement)
    render :index
  end
end
