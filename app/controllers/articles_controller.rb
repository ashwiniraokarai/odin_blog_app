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
    @article = Article.new(article_params)

    if @article.save
      flash.notice = "Flash: Your article '#{@article.title}' has been saved!"
      # call the show page
      redirect_to article_path(@article.id)
    elsif @article.errors.any?
      flash.alert  = "Flash: There was a problem saving your article. Please correct these errors and try again."
      #show filled form again so user can correct error messages extracted and shown to them in the view
      render action: :new
    else
      flash.notice = "Flash: There was a problem saving your article and I am not sure why. Please try again."
      #show filled form again so user can try again
      render action: :new
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    flash.notice = "Your article '#{@article.title}' has been deleted."
    redirect_to articles_path
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    @article.update(article_params)

    if @article.errors.any?
      flash.alert = "There was a problem saving your article. Please correct these errors and try again."
      render action: :edit
    else
      flash.notice = "Your article '#{@article.title}' has been updated!"
      redirect_to article_path(@article)
    end
  end
end
