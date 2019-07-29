class Badge < ApplicationRecord
  has_and_belongs_to_many :users
  belongs_to :badge_rule

  validates :title, presence: true
  validates :image, presence: true
end
