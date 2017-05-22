class Science < ApplicationRecord
  belongs_to :users
  has_many :tests, dependent: :destroy
end
