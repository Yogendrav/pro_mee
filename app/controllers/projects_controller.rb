class ProjectsController < ApplicationController
	before_filter :authenticate_user!
	def index
		@projects = Project.all
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
		@project = Project.new(params[:project])
		debugger
		if @project.save
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
