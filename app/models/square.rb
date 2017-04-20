class Square < ApplicationRecord
  validates :code, uniqueness: true

  def called?
    self.called_timestamp.present?
  end
end
