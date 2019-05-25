class User < ApplicationRecord
  has_many :tests_users
  has_many :tests, through: :tests_users

  validates :name, presence: true

  def by_level(test_level)
    tests.level(test_level)
  end
end
