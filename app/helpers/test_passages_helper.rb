module TestPassagesHelper
  def success_percent(test_passage)
    percentage = test_passage.correct_results
    if test_passage.pass?
      css_class = 'success'
      result = t('.passed')
    else
      css_class = 'error'
      result = t('.failed')
    end
    "<span class='#{css_class}'>#{percentage}%</span>: #{result}".html_safe
  end
end
