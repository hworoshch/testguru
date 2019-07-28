class AwardService
  def initialize(test_passage)
    @test_passage = test_passage
    @user = test_passage.user
    @test = test_passage.test
  end

  def call
    if @test_passage.pass?
      BadgeRule.all.each do |badge_rule|
        award!(badge_rule.badge) if send "#{badge_rule.rule}_award?", badge_rule
      end
    end
  end

  private

  def award!(badge)
    @user.badges << badge
  end

  def complete_category_award?(badge_rule)
    category = Category.find_by(title: badge_rule.value)
    user_tests = @user.tests.where(category: category).ids.uniq
    user_tests == category.tests.ids && @test.category == category
  end

  def first_passage_award?(badge_rule)
    @user.test_passages.where(test: @test).count == 1
  end

  def complete_level_award?(badge_rule)
    level = badge_rule.value
    tests = Test.where(level: level).ids
    user_tests = @user.tests.where(level: level).ids.uniq
    user_tests == tests
  end
end