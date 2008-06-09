class DomainMetasController < ApplicationController
  # GET /domain_metas
  # GET /domain_metas.xml
  def index
    @domain_metas = DomainMeta.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @domain_metas }
    end
  end

  # GET /domain_metas/1
  # GET /domain_metas/1.xml
  def show
    @domain_meta = DomainMeta.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @domain_meta }
    end
  end

  # GET /domain_metas/new
  # GET /domain_metas/new.xml
  def new
    @domain_meta = DomainMeta.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @domain_meta }
    end
  end

  # GET /domain_metas/1/edit
  def edit
    @domain_meta = DomainMeta.find(params[:id])
  end

  # POST /domain_metas
  # POST /domain_metas.xml
  def create
    @domain_meta = DomainMeta.new(params[:domain_meta])

    respond_to do |format|
      if @domain_meta.save
        flash[:notice] = 'DomainMeta was successfully created.'
        format.html { redirect_to(@domain_meta) }
        format.xml  { render :xml => @domain_meta, :status => :created, :location => @domain_meta }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @domain_meta.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /domain_metas/1
  # PUT /domain_metas/1.xml
  def update
    @domain_meta = DomainMeta.find(params[:id])

    respond_to do |format|
      if @domain_meta.update_attributes(params[:domain_meta])
        flash[:notice] = 'DomainMeta was successfully updated.'
        format.html { redirect_to(@domain_meta) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @domain_meta.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /domain_metas/1
  # DELETE /domain_metas/1.xml
  def destroy
    @domain_meta = DomainMeta.find(params[:id])
    @domain_meta.destroy

    respond_to do |format|
      format.html { redirect_to(domain_metas_url) }
      format.xml  { head :ok }
    end
  end
end
