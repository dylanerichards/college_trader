class Listing < ActiveRecord::Base
  default_scope -> { order('created_at DESC') }

  validates_presence_of :name, :asking_price, :description

  belongs_to :category
  belongs_to :user

  has_many :users, through: :comments

  acts_as_commentable

  def users
    self.users.uniq << self.user
  end
end
