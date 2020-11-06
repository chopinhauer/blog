class ArticlesController < ApplicationController
  def show
    # byebug
    @article = Article.find(params[:id])
  end

  def index 
    @article = Article.all 
  end

  def new
    @article=Article.new
  end
  
  def create 
    @article=Article.new(params.require(:article).permit(:tittle, :description))   
    if @article.save
      flash[:notice] = "Article was created succesfully"
      #redirect_to articles_path
      redirect_to @article
    else
      render 'new'
    end
    
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update 
    @article=Article.find(params[:id])
    if @article.update(params.require(:article).permit(:tittle, :description))
      flash[:notice]="Article was updated succesfully"
      redirect_to @article
    else
      render 'edit'
    end

  end


  
end
