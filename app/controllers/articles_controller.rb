class ArticlesController < ApplicationController
  respond_to :html, :js, :json
  
  def index
    @articles = @project.articles.order_by([[:date_published, :desc]])
  end
  
  def show
    @article = Article.find(params[:id]) if params[:id] && @article.nil?
    raise "Article not found: #{env["REQUEST_URI"]}" unless @article
  end
  
  def create
    @article = @project.articles.build(params[:article])
    @article.body = "<h1>This is your new article</h1>#{@article.title}" unless @article.body
    if @article.save
      flash[:notice] = "Your article has been created."
    end
    respond_with @article, :location => articles_path
  end
  
  def new
    @article = Article.new
  end
  
  def edit
    @article = Article.find(params[:id])
  end
  
  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to "/"
  end
  
  def update
    @article = Article.find(params[:id])
    @article.update_attributes(:html => params[:html])
    respond_with @article
  end
end
