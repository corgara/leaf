class SectionsController < ApplicationController
	before_action :set_section, only: [:edit, :update, :show, :destroy]
	def new
		#@section = Section.new
		@notebook = Notebook.find(params[:notebook_id])
  		@section = @notebook.sections
	end
	
	def create 
		@section = Section.new(section_params)
		if @section.save
			flash[:notice] = "Section was successfully created"
			redirect_to sections_path
		else
			render 'new'
		end
	end
	
	def show
		@section = Section.includes(:tabs).find(params[:id])
	end
	
	def edit
	end
	
	def update
		if @section.update(section_params)
			flash[:notice] = "Section was updated"
			redirect_to sections_path
		else
			flash[:notice] = "Section was not updated"
			render 'edit'
		end
	end
	
	def index
		@sections = Section.all
	end
	
	def destroy
		@section.destroy
		flash[:notice] = "Section was deleted"
		redirect_to sections_path
	end
	
	private
		def section_params
			params.require(:section).permit(:title, :description)
		end
		
		def set_section
			@section = Section.find(params[:id])
		end
end
