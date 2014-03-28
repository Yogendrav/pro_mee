class ProjectsController < ApplicationController
	before_filter :authenticate_user!
	def index
		if params[:with] =="my_project"
		  @projects = current_user.projects
		else
				@projects = Project.all
    end	
	end

	def new
		@project = Project.new
		respond_to do |format|
      format.js
    end
	end

	def show
		@project = Project.find(params[:id])
	end

	def edit
		@project = Project.find(params[:id])
	end

	def create
		@project = current_user.projects.create(params[:project])
		debugger
		if @project
			redirect_to projects_path
		else
			render 'new'
		end
	end

	def update
		@project = Project.find(params[:id])
		if @project.update_attributes(:project)
			redirect_to project_path(@project)
		else
			render 'index'
		end
	end

	def destroy
		@project = Project.find(params[:id])
		if @project.delete
			redirect_to projects_path
		else
			render 'index'
		end
	end
end
