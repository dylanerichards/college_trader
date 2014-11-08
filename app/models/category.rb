class Category < ActiveRecord::Base
  has_many :listings

  def to_param
    "#{id}-#{name}"
  end
end
