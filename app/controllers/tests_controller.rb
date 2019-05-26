class TestsController < ApplicationController
  before_action :find_test, only: %i[show]

  def index
    @tests = Test.all
    respond_to do |format|
      format.html 
    end
  end

  private

  def find_test
    @test = Test.find(params[:id])
  end
end
