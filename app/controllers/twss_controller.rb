class TwssController < ApplicationController
  # GET /twsses
  # GET /twsses.json
  def index

    respond_to do |format|
      format.html # index.html.erb
      format.json  { render :json => @twsses }
    end
  end

  # GET /twsses/1
  # GET /twsses/1.json
  def show
    @twss = Twss.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json  { render :json => @twss }
    end
  end

  # GET /twsses/create
  # GET /twsses/create.json
  def create
    @twss = request[:twss]
    TWSS.threshold=(1.0)
    result = TWSS(@twss[:query])
    @twss[:result] = result

    respond_to do |format|
      format.html # create.html.erb
      format.json  { render :json => @twss }
    end
  end

  # PUT /twsses/1
  # PUT /twsses/1.json
  def update
    @twss = Twss.find(params[:id])

    respond_to do |format|
      if @twss.update_attributes(params[:twss])
        format.html { redirect_to(@twss, :notice => 'Twss was successfully updated.') }
        format.json  { head :ok }
      else
        format.html { render :action => "edit" }
        format.json  { render :json => @twss.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /twsses/1
  # DELETE /twsses/1.json
  def destroy
    @twss = Twss.find(params[:id])
    @twss.destroy

    respond_to do |format|
      format.html { redirect_to(twsses_url) }
      format.json  { head :ok }
    end
  end
end
