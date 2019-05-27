class QuestionsController < ApplicationController
  before_action :find_test, only: [:new, :edit]
  before_action :find_question, only: [:show, :edit, :update, :destroy]
  #rescue_from StandardError, with: :not_found

  def show
  end

  def new
    @question = Question.new
  end

  def edit
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      redirect_to test_question_path(@question.test, @question)
    else
      render :new
    end
  end

  def update
    if @question.save
      redirect_to test_question_path(@question.test, @question)
    else
      render :edit
    end
  end

  def destroy
    @question.destroy
    redirect_to test_path(@question.test)
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
