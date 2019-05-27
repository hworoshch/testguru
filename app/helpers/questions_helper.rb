module QuestionsHelper
  def question_header(test)
    case params[:action]
    when 'new' then "Create new #{test.title} question"
    when 'edit' then "Edit #{test.title} question"
    end
  end
end
