class CollageRegionsController < ApplicationController


    layout "default"
  # GET /collage_regions
  # GET /collage_regions.xml
  def index
    @collage_regions = CollageRegion.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @collage_regions }
    end
  end

  # GET /collage_regions/1
  # GET /collage_regions/1.xml
  def show
    @collage_region = CollageRegion.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @collage_region }
    end
  end

  # GET /collage_regions/new
  # GET /collage_regions/new.xml
  def new
    @collage_region = CollageRegion.new

 

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @collage_region }
    end
  end

  # GET /collage_regions/1/edit
  def edit
    @collage_region = CollageRegion.find(params[:id])
  end

  # POST /collage_regions
  # POST /collage_regions.xml
  def create

    logger.fatal("%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%")
    logger.fatal("Ajax post")
    logger.fatal("%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%")

    @collage_region = CollageRegion.new(params[:collage_region])


    respond_to do |format|
      if @collage_region.save
    #    format.js
            format.html { redirect_to(@collage_region.collage_template, :notice => 'CollageRegion was successfully created.') }
    #    format.xml  { render :xml => @collage_region, :status => :created, :location => @collage_region }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @collage_region.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /collage_regions/1
  # PUT /collage_regions/1.xml
  def update
    @collage_region = CollageRegion.find(params[:id])

    respond_to do |format|
      if @collage_region.update_attributes(params[:collage_region])
        format.html { redirect_to(@collage_region.collage_template, :notice => 'CollageRegion was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @collage_region.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /collage_regions/1
  # DELETE /collage_regions/1.xml
  def destroy
    @collage_region = CollageRegion.find(params[:id])
    @collage_region.destroy

    respond_to do |format|
      format.html { redirect_to(@collage_region.collage_template) }
      format.xml  { head :ok }
    end
  end
end
