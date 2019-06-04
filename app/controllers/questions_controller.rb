class QuestionsController < ApplicationController
  before_action :find_test, only: [:new]
  before_action :find_question, only: [:show, :edit, :update, :destroy]

  def show
  end

  def new
    @question = @test.questions.new
  end

  def edit
    @test = Test.find(@question.test_id)
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      redirect_to @question
    else
      render :new
    end
  end

  def update
    if @question.save
      redirect_to @question
    else
      render :edit
    end
  end

  def destroy
    @question.destroy
    redirect_to @question.test
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
end
