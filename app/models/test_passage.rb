class TestPassage < ApplicationRecord
  SUCCESS_PERCENT = 85

  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_create :set_first_question
  before_update :set_next_question
 
  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answer?(answer_ids)
    save!
  end

  def completed?
    current_question.nil?
  end

  def correct_results
    correct_questions.to_f / test.questions.count * 100
  end

  def pass?
    correct_results >= SUCCESS_PERCENT
  end

  def question_number
    test.questions.where('questions.id <= ?', current_question.id).count
  end

  private

  def correct_answer?(answer_ids)
    if answer_ids
      correct_answers.ids.sort == answer_ids.map(&:to_i).sort
    end
  end

  def correct_answers
    current_question.answers.correct
  end

  def next_question
    test.questions.order(:id).where('id > ?', current_question.id).first
  end

  def set_first_question
    self.current_question = test.questions.first
  end

  def set_next_question
    self.current_question = next_question
  end
end
