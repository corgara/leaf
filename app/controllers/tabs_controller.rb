class TabsController < ApplicationController
	before_action :set_tab, only: [:edit, :update, :show, :show_section, :destroy]
	def new
		@tab = Tab.new
	end
	
	def create 
		@tab = Tab.new(tab_params)
		if @tab.save
			flash[:notice] = "Tab was successfully created"
			redirect_to tabs_path
		else
			render 'new'
		end
	end
	
	def show
		@tab = Tab.includes(:sections).find(params[:id])
	end
	
	def edit
	end
	
	def update
		if @tab.update(tab_params)
			flash[:notice] = "Tab was updated"
			redirect_to tabs_path
		else
			flash[:notice] = "Tab was not updated"
			render 'edit'
		end
	end
	
	def index
		@tabs = Tab.all
	end
	
	def destroy
		@tab.destroy
		flash[:notice] = "Tab was deleted"
		redirect_to tabs_path
	end
	
	private
		def tab_params
			params.require(:tab).permit(:title, :description)
		end
		
		def set_tab
			@tab = Tab.find(params[:id])
		end
end
