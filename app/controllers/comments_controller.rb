class CommentsController < ApplicationController
  def create
    listing = Listing.find(params[:listing_id])
    comment = listing.comments.new(comment_params)
    users = listing.users#.where.not(id: current_user.id)

    if comment.save
      current_user.comments << comment

      client = Twilio::REST::Client.new(TWILIO_CONFIG['sid'], TWILIO_CONFIG['token'])

      users.each do |user|
        client.account.sms.messages.create(
          from: TWILIO_CONFIG['from'],
          to: user.phone,
          body: "#{comment.user.email} commented on '#{listing.name}': \n '#{comment.comment}'"
        )
      end

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
