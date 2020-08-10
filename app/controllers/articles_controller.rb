class ArticlesController < ApplicationController
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
    @article = Article.new(title: params[:article][:title], body: params[:article][:body] )
    @article.save
    redirect_to article_path(@article)
  end
end
