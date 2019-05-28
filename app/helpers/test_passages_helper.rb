module TestPassagesHelper
  TEST_PASSED = 'Test passed!'
  TEST_FAILED = 'Test failed!'

  def success_percent(test_passage)
    percentage = test_passage.correct_results
    if test_passage.pass?
      css_class = 'success'
      result = TEST_PASSED
    else
      css_class = 'error'
      result = TEST_FAILED
    end
    "<span class='#{css_class}'>#{percentage}%</span>: #{result}".html_safe
  end
end
