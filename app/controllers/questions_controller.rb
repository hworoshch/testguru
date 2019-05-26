class QuestionsController < ApplicationController
  before_action :find_test, only: [:index, :new]
  before_action :find_question, only: [:show, :destroy]
  rescue_from StandardError, with: :not_found

  def index
    @questions = @test.questions
  end

  def show
    
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.create(question_params)
    render plain: @question
  end

  def destroy
    @question.destroy
    redirect_to root_path
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:body, :test_id)
  end

  def not_found
    render plain: 'Question was not found'
  end
end
