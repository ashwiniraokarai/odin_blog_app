class ArticlesController < ApplicationController
  include ArticlesHelper

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    # Wrapping a blank (unsaved) object in @article instance var
    # just to get around the nil error for @article on form.
    # If you tried this in the console, the resulting object look like so:
    # => #<Article id: nil, title: nil, body: nil, created_at: nil, updated_at: nil>
    @article = Article.new
  end

  def create
    @article = Article.create(article_params)
    # popular alternative:
      # @article = Article.new(article_params)
      # @article.save
    # finally call the show page
    redirect_to article_path(@article.id)
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    @article.update(article_params)
    redirect_to article_path(@article)
  end
end
