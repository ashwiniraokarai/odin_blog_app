class CommentsController < ApplicationController
  include CommentsHelper

  def create
    @comment = Comment.new(comment_params)
    @comment.save
    render plain: "hello"
    # render the article show page (which is set up to show posted comments anyway)
  end
end
