class CommentsController < ApplicationController
  include CommentsHelper

  def create
    @article_id = params[:article_id]
    @comment = Comment.new(comment_params)
    @comment.article_id = @article_id
    @comment.save
    # render plain: "hello"  #when testing

    if @comment.errors.any?
     flash.alert = "Oops there was a problem posting your comment! Please correct errors and try again."
     render "articles/show", locals: {:@article => @comment.article}
    else
     flash.notice = "Your comment was posted successfully!"
     # redirect_to article show page after posting comment (which is already set up to show posted comments anyway)
     redirect_to article_path(@comment.article_id)
    end
  end
end
