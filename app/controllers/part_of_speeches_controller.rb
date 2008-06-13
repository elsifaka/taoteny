class PartOfSpeechesController < ApplicationController
  # GET /part_of_speeches
  # GET /part_of_speeches.xml
  def index
    @part_of_speeches = PartOfSpeech.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @part_of_speeches }
    end
  end

  # GET /part_of_speeches/1
  # GET /part_of_speeches/1.xml
  def show
    @part_of_speech = PartOfSpeech.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @part_of_speech }
    end
  end

  # GET /part_of_speeches/new
  # GET /part_of_speeches/new.xml
  def new
    @part_of_speech = PartOfSpeech.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @part_of_speech }
    end
  end

  # GET /part_of_speeches/1/edit
  def edit
    @part_of_speech = PartOfSpeech.find(params[:id])
  end

  # POST /part_of_speeches
  # POST /part_of_speeches.xml
  def create
    @part_of_speech = PartOfSpeech.new(params[:part_of_speech])

    respond_to do |format|
      if @part_of_speech.save
        flash[:notice] = 'PartOfSpeech was successfully created.'
        format.html { redirect_to(@part_of_speech) }
        format.xml  { render :xml => @part_of_speech, :status => :created, :location => @part_of_speech }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @part_of_speech.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /part_of_speeches/1
  # PUT /part_of_speeches/1.xml
  def update
    @part_of_speech = PartOfSpeech.find(params[:id])

    respond_to do |format|
      if @part_of_speech.update_attributes(params[:part_of_speech])
        flash[:notice] = 'PartOfSpeech was successfully updated.'
        format.html { redirect_to(@part_of_speech) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @part_of_speech.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /part_of_speeches/1
  # DELETE /part_of_speeches/1.xml
  def destroy
    @part_of_speech = PartOfSpeech.find(params[:id])
    @part_of_speech.destroy

    respond_to do |format|
      format.html { redirect_to(part_of_speeches_url) }
      format.xml  { head :ok }
    end
  end
end
