class Test < ApplicationRecord
  belongs_to :category
  has_many :questions
  has_many :tests_users
  has_many :users, through: :tests_users

  def self.find_by_category(category_title)
    category = Category.find_by(title: category_title)
    category.tests.order(title: :desc).pluck(:title)
  end
end
