class AwardService
  def initialize(test_passage)
    @test_passage = test_passage
    @user = test_passage.user
    @test = test_passage.test
  end

  def call
    if @test_passage.pass?
      complete_category
      first_passage
      complete_level
    end
  end

  def award!(badge)
    @user.badges << badge
  end

  def complete_category
    badge_rule = find_badge_rule('complete_category')
    category = Category.find_by(title: badge_rule.value)
    user_tests = @user.tests.where(category: category).ids.uniq
    award!(badge_rule.badge) if user_tests == category.tests.ids && @test.category == category
  end

  def first_passage
    award!(find_badge_rule('first_passage').badge) if @user.test_passages.where(test: @test).count == 1
  end

  def complete_level
    badge_rule = find_badge_rule('complete_level')
    level = badge_rule.value
    tests = Test.where(level: level).ids
    user_tests = @user.tests.where(level: level).ids.uniq
    award!(badge_rule.badge) if user_tests == tests
  end

  def find_badge_rule(rule)
    BadgeRule.where(rule: rule).first
  end
end