class ArticlesController < ApplicationController
	before_action :set_article, only: [:edit, :update, :show, :destroy]
	before_action :load_articleInterface

	def new
		@article = Article.new
	end
	
	def create 
		@article = Article.new(article_params)
		if @article.save
			flash[:notice] = "Article was successfully created"
			redirect_to [@articleInterface, article]
		else
			render 'new'
		end
	end
	
	def show
	end
	
	def edit
	end
	
	def update
		if @article.update(article_params)
			flash[:notice] = "Article was updated"
			redirect_to [@articleInterface, article]
		else
			flash[:notice] = "Article was not updated"
			render 'edit'
		end
	end
	
	def index
		@articles = Article.all
	end
	
	def destroy
		@article.destroy
		flash[:notice] = "Article was deleted"
		redirect_to [@articleInterface, "articles"]
	end
	
	private
		def article_params
			params.require(:article).permit(:title, :description)
		end
		
		def set_article
			@article = Article.find(params[:id])
		end

		# def load_articleInterface
		# 	resource, id = request.path('/')[1,2] 	# /notebook/1
		# 	@articleInterface = resource.singularize.classify.constantize.find(id) 		# notebook.find(1)
		# end

		def load_articleInterface
			articleResource = [Notebook, Section, Tab, Page, Paragraph].detect { |c| params["#{c.name.underscore}_id"] }
			@articleInterface = articleResource.find( params["#{articleResource.name.underscore}_id"] )
		end
end
