class Listing < ActiveRecord::Base
  default_scope -> { order('created_at DESC') }

  belongs_to :category

  acts_as_commentable
end
