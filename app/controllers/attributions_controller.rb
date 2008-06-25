class AttributionsController < ApplicationController
  before_filter :fetch_entry
  # GET /attributions
  # GET /attributions.xml
  def index
    @attributions = Attribution.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @attributions }
    end
  end

  # GET /attributions/1
  # GET /attributions/1.xml
  def show
    @attribution = Attribution.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @attribution }
    end
  end

  # GET /attributions/new
  # GET /attributions/new.xml
  def new
    @attribution = Attribution.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @attribution }
    end
  end

  # GET /attributions/1/edit
  def edit
    @attribution = Attribution.find(params[:id])
  end

  # POST /attributions
  # POST /attributions.xml
  def create
    @attribution = Attribution.new(params[:attribution])

    respond_to do |format|
      if @attribution.save
        flash[:notice] = 'Attribution was successfully created.'
        format.html { redirect_to(@attribution) }
        format.xml  { render :xml => @attribution, :status => :created, :location => @attribution }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @attribution.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /attributions/1
  # PUT /attributions/1.xml
  def update
    @attribution = Attribution.find(params[:id])

    respond_to do |format|
      if @attribution.update_attributes(params[:attribution])
        flash[:notice] = 'Attribution was successfully updated.'
        format.html { redirect_to(@attribution) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @attribution.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /attributions/1
  # DELETE /attributions/1.xml
  def destroy
    @attribution = Attribution.find(params[:id])
    @attribution.destroy

    respond_to do |format|
      format.html { redirect_to(attributions_url) }
      format.xml  { head :ok }
    end
  end
  
  private
  def fetch_entry
    @entry = Entry.find(params[:entry_id])
  end
end
