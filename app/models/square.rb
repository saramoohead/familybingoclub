class Square < ApplicationRecord
  validates :code, uniqueness: true

  has_and_belongs_to_many :boards

  def called?
    self.called_timestamp.present?
  end
end
