require './test/test_helper'
require './lib/crack'

class CrackTest < Minitest::Test
  def setup
    @crack = Crack.new('m5g536qkl,85 0prmv9l .bl4',\
                       32_435, '051218')
  end

  def test_crack_exists
    assert_instance_of Crack, @crack
  end

  def test_crack_takes_a_message
    assert_equal 'm5g536qkl,85 0prmv9l .bl4', @crack.message
  end

  def test_crack_takes_a_key
    assert_equal 32_435, @crack.key
  end

  def test_crack_takes_a_date
    assert_equal '051218', @crack.date
  end

  def test_crack_has_characters
    assert @crack.characters.include? 'a'
    assert @crack.characters.include? '0'
    assert @crack.characters.include? '.'
  end

  def test_last_four_chars_of_message
    last_four = @crack.last_four_chars_of_message
    assert_equal '.bl4', last_four
  end

  def test_find_key_values_from_last_4
end
