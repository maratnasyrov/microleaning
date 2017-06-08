class Question < ApplicationRecord
  belongs_to :tests
  belongs_to :users
  has_many :answers, dependent: :destroy
  has_many :user_answers
end
