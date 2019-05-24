class Test < ApplicationRecord

  has_many :questions
  has_many :users
  belongs_to :category
  belongs_to :user

  def self.find_by_category(category_title)
    category = Category.find_by(title: category_title)
    @tests = Test.where('category_id = :category_id', category_id: category.id).order(title: :desc).pluck(:title)
  end

end
