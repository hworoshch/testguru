class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable
  has_many :test_passages
  has_many :tests, through: :test_passages
  has_many :gists
  has_many :feedbacks
  has_and_belongs_to_many :badges

  validates :name, presence: true
  validates :lastname, presence: true

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end

  def by_level(test_level)
    tests.level(test_level)
  end

  def admin?
    is_a?(Admin)
  end
end