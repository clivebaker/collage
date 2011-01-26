class CollageTemplatesController < ApplicationController

    layout "default"
  # GET /collage_templates
  # GET /collage_templates.xml
  def index
    @collage_templates = CollageTemplate.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @collage_templates }
    end
  end

  # GET /collage_templates/1
  # GET /collage_templates/1.xml
  def show
    @collage_template = CollageTemplate.find(params[:id])
    @collage_regions = CollageRegion.find_all_by_collage_template_id(params[:id])
    @collage_region = CollageRegion.new

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @collage_template }
    end
  end

  # GET /collage_templates/new
  # GET /collage_templates/new.xml
  def new
    @collage_template = CollageTemplate.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @collage_template }
    end
  end

  # GET /collage_templates/1/edit
  def edit
    @collage_template = CollageTemplate.find(params[:id])
  end

  # POST /collage_templates
  # POST /collage_templates.xml
  def create
    @collage_template = CollageTemplate.new(params[:collage_template])
   # post = CollageTemplate.save(params[:collage_template])

    respond_to do |format|
      if @collage_template.save
        format.html { redirect_to(@collage_template, :notice => 'CollageTemplate was successfully created.') }
        format.xml  { render :xml => @collage_template, :status => :created, :location => @collage_template }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @collage_template.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /collage_templates/1
  # PUT /collage_templates/1.xml
  def update
    @collage_template = CollageTemplate.find(params[:id])

    respond_to do |format|
      if @collage_template.update_attributes(params[:collage_template])
        format.html { redirect_to(@collage_template, :notice => 'CollageTemplate was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @collage_template.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /collage_templates/1
  # DELETE /collage_templates/1.xml
  def destroy
    @collage_template = CollageTemplate.find(params[:id])
    @collage_template.destroy

    respond_to do |format|
      format.html { redirect_to(collage_templates_url) }
      format.xml  { head :ok }
    end
  end
end
