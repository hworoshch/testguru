module TestPassagesHelper
  def success_percent(test_passage)
    percentage = test_passage.correct_results
    if test_passage.pass?
      css_class = 'alert alert-success'
      result = t('.passed')
    else
      css_class = 'alert alert-danger'
      result = t('.failed')
    end
    "<div class='#{css_class} mt-4'><strong>#{percentage}%</strong>: #{result}</div>".html_safe
  end
end
