class User < ApplicationRecord

  has_many :answers
  has_meny :tests

  def tests_by_level(level)
    answers = Answer.where('user_id = ?', self.id)
    questions = Question.find(answers.pluck(:question_id))
    tests = Test.find(questions.pluck(:test_id)).select { |t| t.level == level }
  end

end
