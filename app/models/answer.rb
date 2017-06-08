class Answer < ApplicationRecord
  belongs_to :questions
  has_many :user_answers
end
