users = User.create(
    [{ email: 'hworoshch@gmail.com', type: 'Admin', name: 'Artemiy', lastname: 'Novikov', password: '123qwe' },
     { email: 'petrov@domain.ru', name: 'Ivan', lastname: 'Petrov', password: 'qwe123' }]
)

categories = Category.create(
    [{ title: 'Backend' },
     { title: 'Frontend' }]
)

tests = Test.create(
    [{ title: 'Ruby test for begginer', level: 1, category: categories[0], author_id: users[0].id },
     { title: 'HTML test for middle', level: 2, category: categories[1], author_id: users[0].id },
     { title: 'JS test for middle', level: 3, category: categories[1], author_id: users[0].id }]
)

questions = Question.create(
    [{ body: 'What means tag p?', test_id: tests[1].id },
     { body: 'What means sybmol?', test_id: tests[0].id },
     { body: 'What means hash?', test_id: tests[0].id },
     { body: 'What means array?', test_id: tests[0].id },
     { body: 'What are tags?', test_id: tests[1].id },
     { body: 'How do you insert a comment in HTML', test_id: tests[1].id },
     { body: 'How show log in console?', test_id: tests[2].id },
     { body: 'What would be the result of 2+5+”3″?', test_id: tests[2].id },
     { body: 'What is NaN in JavaScript?', test_id: tests[2].id }]
)

answers = Answer.create(
    [{ body: 'this mean a paragraph', correct: true, question_id: questions[0].id },
     { body: 'this mean an break', correct: false, question_id: questions[0].id },
     { body: 'variable name prefixed with a colon', correct: true, question_id: questions[1].id },
     { body: 'variable name like a string', correct: false, question_id: questions[1].id },
     { body: 'dictionary-like collection of unique keys and their values', correct: true, question_id: questions[2].id },
     { body: 'ordered, integer-indexed collections of any object', correct: false, question_id: questions[2].id },
     { body: 'ordered, integer-indexed collections of any object', correct: true, question_id: questions[3].id },
     { body: 'not ordered, integer-indexed collections of any object', correct: false, question_id: questions[3].id },
     { body: 'tags provide the directions or recipes for the visual content', correct: true, question_id: questions[4].id },
     { body: 'tags its strings for HTML document', correct: false, question_id: questions[4].id },
     { body: '<!-- -->', correct: true, question_id: questions[5].id },
     { body: '//', correct: false, question_id: questions[5].id },
     { body: 'console.log', correct: true, question_id: questions[6].id },
     { body: 'log.console', correct: false, question_id: questions[6].id },
     { body: '73', correct: true, question_id: questions[7].id },
     { body: '10', correct: false, question_id: questions[7].id },
     { body: 'Null a Number', correct: false, question_id: questions[8].id },
     { body: 'Not a Number', correct: true, question_id: questions[8].id }]
)

badge_rules = BadgeRule.create(
    [{ rule: 'complete_category', value: 'Backend' },
     { rule: 'first_passage', value: '' },
     { rule: 'complete_level', value: '1' }]
)

badges = Badge.create(
    [{ title: 'Все тесты категории Backend', image: "https://d29fhpw069ctt2.cloudfront.net/icon/image/50661/preview.svg", badge_rule: badge_rules[0] },
    { title: 'С первой попытки', image: "https://d29fhpw069ctt2.cloudfront.net/icon/image/50660/preview.svg", badge_rule: badge_rules[1] },
    { title: 'Все тесты первого уровня', image: "https://d29fhpw069ctt2.cloudfront.net/icon/image/50659/preview.svg", badge_rule: badge_rules[2] }]
)