class Board < ApplicationRecord
  validates :code, uniqueness: true
  validates :type, presence: true

  has_and_belongs_to_many :squares
end
