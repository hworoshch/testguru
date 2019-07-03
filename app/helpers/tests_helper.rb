module TestsHelper
  TEST_LEVELS = { 0 => :easy, 1 => :elementary, 2 => :advanced, 3 => :hard }.freeze

  def test_level(test)
    level = TEST_LEVELS[test.level] || :hero
    t(".level-#{level}")
  end
end
