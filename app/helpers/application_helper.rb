module ApplicationHelper
  def year
    Time.current.year
  end

  def github_url(author, repo)
    "https://github.com/#{author}/#{repo}"
  end

  def flash_message(message)
    content_tag :p, flash[:alert], class: 'flash alert'
  end
end
