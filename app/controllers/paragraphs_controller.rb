class ParagraphsController < ApplicationController
	before_action :set_paragraph, only: [:edit, :update, :show, :show_section, :destroy]
	def new
		@paragraph = Paragraph.new
	end
	
	def create 
		@paragraph = Paragraph.new(paragraph_params)
		if @paragraph.save
			flash[:notice] = "Paragraph was successfully created"
			redirect_to paragraphs_path
		else
			render 'new'
		end
	end
	
	def show
	end
	
	def edit
	end
	
	def update
		if @paragraph.update(paragraph_params)
			flash[:notice] = "Paragraph was updated"
			redirect_to paragraphs_path
		else
			flash[:notice] = "Paragraph was not updated"
			render 'edit'
		end
	end
	
	def index
		@paragraphs = Paragraph.all
	end
	
	def destroy
		@paragraph.destroy
		flash[:notice] = "Paragraph was deleted"
		redirect_to paragraphs_path
	end
	
	private
		def paragraph_params
			params.require(:paragraph).permit(:title, :description)
		end
		
		def set_paragraph
			@paragraph = Paragraph.find(params[:id])
		end
end
