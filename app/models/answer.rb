class Answer < ApplicationRecord
  MAX_ANSWERS = 7

  belongs_to :question

  scope :correct, -> { where(correct: true) }

  validates :body, presence: true
  validate :max_count

  private

  def max_count
    errors.add(:max_count, 'Too many answers') if question && question.answers.count > MAX_ANSWERS
  end
end
