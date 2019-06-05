# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = User.create([{ name: 'Max Cavalera', level: 3 }, { name: 'Igor Cavalera', level: 2 }, { name: 'Paulo Junior', level: 2 }, { name: 'Jairo Guedes', level: 1 }, { name: 'Derrick Green', level: 0 }])

categories = Category.create([{ title: 'Mobile Development' }, { title: 'Ruby on Rails' }, { title: 'HTML' }])

categories.each do |category|
  3.times do |i|
    Test.create({ title: "Test #{category.title} ##{i}", level: i, category_id: category.id })
  end
end

Test.all.each do |test|
  3.times do |i|
    Question.create({ body: "Question ##{i}", test_id: test.id })
  end
end

users.each do |user|
  Question.all.each do |question|
    Answer.create({ body: "Answer", correct: rand(2), question_id: question.id })
  end
end
