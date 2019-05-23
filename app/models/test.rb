class Test < ApplicationRecord

  def self.find_by_category(category_title)
    category = Category.find_by(title: category_title)
    @tests = Test.where('category_id = :category_id', category_id: category.id).order(title: :desc).pluck(:title)
  end

end
