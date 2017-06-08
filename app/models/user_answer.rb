class UserAnswer < ApplicationRecord
  belongs_to :games
  belongs_to :questions
  belongs_to :answers
end
