class Game < ApplicationRecord
  belongs_to :tests
  has_many :user_answers
end
