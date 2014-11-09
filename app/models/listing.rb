class Listing < ActiveRecord::Base
  default_scope -> { order('created_at DESC') }

  validates_presence_of :name, :asking_price, :description

  belongs_to :category
  belongs_to :user

  acts_as_commentable
end
