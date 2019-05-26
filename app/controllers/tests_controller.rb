class TestsController < ApplicationController
  def index
    @tests = Test.all
    respond_to do |format|
      format.html 
    end
  end
end
