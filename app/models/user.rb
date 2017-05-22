class User < ApplicationRecord
  acts_as_token_authenticatable
  has_many :sciences
  
  devise :database_authenticatable, :registerable, :confirmable,
    :recoverable, :rememberable, :trackable, :validatable

  validates :full_name, presence: true
end
