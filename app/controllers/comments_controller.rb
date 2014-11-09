class CommentsController < ApplicationController
  def create
    listing = Listing.find(params[:listing_id])
    comment = listing.comments.new(comment_params)

    if comment.save
      current_user.comments << comment
      redirect_to :back
    else
      redirect_to :back
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end
end
