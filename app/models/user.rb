class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  # validates_format_of :email, :with => /\b(?:(?![_.-])(?!.*[_.-]{2})[a-z0-9_.-]+(?<![_.-]))@(?:(?!-)(?!.*--)[a-z0-9-]+(?<!-)\.)*albany\.edu\b/i

  has_many :comments
  has_many :listings
  belongs_to :listing
end
