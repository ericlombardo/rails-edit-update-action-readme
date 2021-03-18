class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new
    @article.title = params[:title]
    @article.description = params[:description]
    @article.save
    redirect_to article_path(@article)
  end

  def edit # show edit form
    @article = Article.find_by_id(params[:id])
  end

  def update # update the instance with form info
    @article = Article.find_by_id(params[:id])
    @article.update(title: params[:article][:title], description: params[:article][:description])

    redirect_to article_path(@article)
  end

end
