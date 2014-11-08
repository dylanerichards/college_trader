class Listing < ActiveRecord::Base
  belongs_to :category

  acts_as_commentable
end
