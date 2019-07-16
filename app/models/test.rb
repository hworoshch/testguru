class Test < ApplicationRecord
  belongs_to :category
  has_many :questions, dependent: :destroy
  has_many :test_passages, dependent: :destroy
  has_many :users, through: :test_passages

  scope :with_questions, -> { includes(:questions).where.not(questions: { id: nil }) }

  scope :level, -> (level) { where(level: level) }
  scope :easy, -> { level(0..1) }
  scope :medium, -> { level(2..4) }
  scope :hard, -> { level(5..Float::INFINITY) }
  scope :by_category, -> (category_title) { joins(:category).where(categories: { title: category_title }) }

  validates :level, presence: true,
                    numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :title, presence: true,
                    uniqueness: { scope: :level, case_sensitive: false }
end
