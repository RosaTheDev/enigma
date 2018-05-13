require './test/test_helper'
require './lib/enigma'

class EnigmaTest < Minitest::Test
  def setup
    @enigma = Enigma.new('pizza', 32_435)
  end

  def test_enigma_exists
    assert_instance_of Enigma, @enigma
  end

  def test_enigma_takes_a_key
    assert_equal 32_435, @enigma.key
  end

  def test_enigma_takes_a_message
    assert_equal 'pizza', @enigma.message
  end

  def test_date
    assert_equal '051218', @enigma.date
  end

  def test_enigma_has_characters
    # skip
    assert @enigma.characters.include? 'a'
    assert @enigma.characters.include? '0'
    assert @enigma.characters.include? '.'
  end

  def test_split_into_four_ints
    # skip
    key_array = @enigma.split_into_four_strings

    assert_equal 4, key_array.length
  end

  def test_change_four_strings_to_ints
    # skip
    key_array = @enigma.split_into_four_strings
    key_ints = @enigma.strings_to_ints(key_array)

    assert_instance_of Integer, key_ints[0]
  end

  def test_each_split_is_between_0_and_100
    # skip
    key_array = @enigma.split_into_four_strings
    key_ints = @enigma.strings_to_ints(key_array)

    assert key_ints[0] < 100 && key_ints[0] > 0
    assert key_ints[1] < 100 && key_ints[0] > 0
    assert key_ints[2] < 100 && key_ints[0] > 0
    assert key_ints[3] < 100 && key_ints[0] > 0
  end
end
