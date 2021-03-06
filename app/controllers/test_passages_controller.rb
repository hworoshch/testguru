class TestPassagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_test_passage, only: [:show, :update, :result, :gist]

  def show
  end

  def result
  end

  def update
    @test_passage.accept!(params[:answer_ids])
    if @test_passage.completed? || @test_passage.time_is_over?
      AwardService.new(@test_passage).call
      TestsMailer.completed_test(@test_passage).deliver_now
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  def gist
    result = GistQuestionService.new(@test_passage.current_question)
    result.call
    flash_options = if result.success?
      current_user.gists.create(question: @test_passage.current_question, url: result.response.id)
      { notice: "#{t('.success')} #{result.response.html_url}" }
    else
      { alert: t('.failure') }
    end
    redirect_to @test_passage, flash_options
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end
