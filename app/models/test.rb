class Test < ApplicationRecord
  belongs_to :sciences
  has_many :questions, dependent: :destroy
  has_many :games
end
