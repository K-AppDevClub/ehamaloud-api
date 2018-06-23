class Score < ApplicationRecord
  has_one :voice, dependent: :destroy
  accepts_nested_attributes_for :voice

  validates :user_id, presence: true
end

