class Square < ApplicationRecord
  has_and_belongs_to_many :boards

  validates :category, presence: true
  validates :exclude, exclusion: { in: [nil] }

  before_validation do
    self.exclude = true
  end

  def called?
    self.called_timestamp.present?
  end
end
