gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative 'medusa'
require_relative 'person'

class MedusaTest < Minitest::Test
  def test_it_has_a_name
    medusa = Medusa.new("Cassiopeia")
    assert_equal "Cassiopeia", medusa.name
  end

  def test_when_first_created_she_has_no_statues
    medusa = Medusa.new("Cassiopeia")
    assert medusa.statues.empty?
  end

  def test_when_staring_at_a_person_she_gains_a_statue
    medusa = Medusa.new("Cassiopeia")
    victim = Person.new("Perseus")

    medusa.stare(victim)
    assert_equal 1, medusa.statues.count
    assert_equal "Perseus", medusa.statues.first.name
  end

  def test_when_staring_at_a_person_that_person_turns_to_stone
    medusa = Medusa.new("Cassiopeia")
    victim = Person.new("Perseus")

    refute victim.stoned?
    medusa.stare(victim)
    assert victim.stoned?
  end

  def test_can_only_have_three_victims
    medusa = Medusa.new("Cassiopeia")
    victim = Person.new("Perseus")
    victim2 = Person.new("Charlie")
    victim3 = Person.new("Steve")

    medusa.stare(victim)
    medusa.stare(victim2)
    medusa.stare(victim3)

    assert_equal 3, medusa.statues.count
  end

  def test_if_a_fourth_victim_is_stoned_first_is_unstoned
    medusa = Medusa.new("Cassiopeia")
    victim = Person.new("Perseus")
    victim2 = Person.new("Charlie")
    victim3 = Person.new("Steve")
    victim4 = Person.new("Marie")

    medusa.stare(victim)
    medusa.stare(victim2)
    medusa.stare(victim3)
    assert_equal 3, medusa.statues.count
    assert_equal "Perseus", medusa.statues.first.name
    medusa.stare(victim4)
    assert_equal 3, medusa.statues.count
    assert_equal "Charlie", medusa.statues.first.name
  end
end
