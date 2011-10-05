class ProjectTypesController < ApplicationController
  # GET /project_types
  # GET /project_types.json
  def index
    @project_types = ProjectType.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @project_types }
    end
  end

  # GET /project_types/1
  # GET /project_types/1.json
  def show
    @project_type = ProjectType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @project_type }
    end
  end

  # GET /project_types/new
  # GET /project_types/new.json
  def new
    @project_type = ProjectType.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @project_type }
    end
  end

  # GET /project_types/1/edit
  def edit
    @project_type = ProjectType.find(params[:id])
  end

  # POST /project_types
  # POST /project_types.json
  def create
    @project_type = ProjectType.new(params[:project_type])

    respond_to do |format|
      if @project_type.save
        format.html { redirect_to @project_type, notice: 'Project type was successfully created.' }
        format.json { render json: @project_type, status: :created, location: @project_type }
      else
        format.html { render action: "new" }
        format.json { render json: @project_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /project_types/1
  # PUT /project_types/1.json
  def update
    @project_type = ProjectType.find(params[:id])

    respond_to do |format|
      if @project_type.update_attributes(params[:project_type])
        format.html { redirect_to @project_type, notice: 'Project type was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @project_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /project_types/1
  # DELETE /project_types/1.json
  def destroy
    @project_type = ProjectType.find(params[:id])
    @project_type.destroy

    respond_to do |format|
      format.html { redirect_to project_types_url }
      format.json { head :ok }
    end
  end
end
