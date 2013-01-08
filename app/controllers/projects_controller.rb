class ProjectsController < ApplicationController
  # GET /projects
  def index
    @projects = current_user.projects

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # POST /projects
  def create
    @project = Project.new(params[:project])
    @project.user_id = current_user.id

    respond_to do |format|
      if @project.save
        format.js
      else
        format.js { render "shared/failure", locals: { messages: @project.errors.full_messages } }
      end
    end
  end

  # PUT /projects/1
  def update
    @project = Project.find(params[:id])

    if @project.user_id == current_user.id
      respond_to do |format|
        if @project.update_attributes(params[:project])
          format.js
        else
          format.js { render "shared/failure", locals: { messages: @project.errors.full_messages } }
        end
      end
    else
      redirect_to root_url
    end
  end

  # DELETE /projects/1
  def destroy
    @project = Project.find(params[:id])
    @project.destroy if @project.user_id == current_user.id

    respond_to do |format|
      format.js
    end
  end
end
