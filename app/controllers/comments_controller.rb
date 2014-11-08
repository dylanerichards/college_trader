class CommentsController < ApplicationController
  def create
    listing = Listing.find(params[:listing_id])
    comment = listing.comments.new(comment_params)

    if comment.save
      redirect_to root_path
    else
      redirect_to :back
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end
end
