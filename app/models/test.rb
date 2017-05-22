class Test < ApplicationRecord
  belongs_to :sciences
  has_many :questions
end
