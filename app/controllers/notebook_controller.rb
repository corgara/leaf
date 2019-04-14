class NotebookController < ApplicationController
	before_action :set_notebook, only: [:edit, :update, :show, :destroy]

	def new
		@notebook = Notebook.new
	end
	
	def create 
		@notebook = Notebook.new(notebook_params)
		if @notebook.save
			flash[:notice] = "Notebook was successfully created"
			redirect_to notebook_path
		else
			render 'new'
		end
	end
	
	def show
	end
	
	def edit
	end
	
	def update
		if @notebook.update(notebook_params)
			flash[:notice] = "Notebook was updated"
			redirect_to notebook_path
		else
			flash[:notice] = "Notebook was not updated"
			render 'edit'
		end
	end
	
	def index
		@notebooks = Notebook.all
	end
	
	def destroy
		@notebook.destroy
		flash[:notice] = "Notebook was deleted"
		redirect_to notebook_path
	end
	
	private
		def notebook_params
			params.require(:notebook).permit(:title, :description)
		end
		
		def set_notebook
			@notebook = Notebook.find(params[:id])
		end

end
