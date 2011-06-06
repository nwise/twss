class HomepageController < ApplicationController
  def index
    render :index
  end

  def query
    @query = params[:query][:query]
    @result = TWSS(@query)
    debugger
    render :index
  end
end
