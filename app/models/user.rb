class User < ApplicationRecord
  has_many :test_passages
  has_many :tests, through: :test_passages

  validates :name, presence: true

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end

  def by_level(test_level)
    tests.level(test_level)
  end
end
