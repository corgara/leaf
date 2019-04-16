class PagesController < ApplicationController
	before_action :set_page, only: [:edit, :update, :show, :destroy]
	def new
		@page = Page.new
	end
	
	def create 
		@page = Page.new(page_params)
		if @page.save
			flash[:notice] = "Page was successfully created"
			redirect_to pages_path
		else
			render 'new'
		end
	end
	
	def show
		@page = Page.includes(:paragraphs).find(params[:id])
	end
	
	def edit
	end
	
	def update
		if @page.update(page_params)
			flash[:notice] = "Page was updated"
			redirect_to pages_path
		else
			flash[:notice] = "Page was not updated"
			render 'edit'
		end
	end
	
	def index
		@pages = Page.all
	end
	
	def destroy
		@page.destroy
		flash[:notice] = "Page was deleted"
		redirect_to pages_path
	end
	
	private
		def page_params
			params.require(:page).permit(:title, :description)
		end
		
		def set_page
			@page = Page.find(params[:id])
		end
end
