require './test/test_helper'
require './lib/enigma'

class EnigmaTest < Minitest::Test
  def setup
    @enigma = Enigma.new('pizza', [5, 7, 2, 4])
  end

  def test_enigma_exists
    assert_instance_of Enigma, @enigma
  end

  def test_enigma_takes_a_key
    assert_equal [5, 7, 2, 4], @enigma.key
  end

  def test_enigma_takes_a_message
    assert_equal 'pizza', @enigma.message
  end

  def test_date
    assert_equal '051218', @enigma.date
  end

  def test_enigma_has_characters
    assert @enigma.characters.include? 'a'
    assert @enigma.characters.include? '0'
    assert @enigma.characters.include? '.'
  end

  def test_split_into_four_ints
    key_array = @enigma.split(32_435)

    assert_equal 4, key_array.length
  end

  def test_each_split_is_between_0_and_100
    key_array = @enigma.split(32_435)

    assert key_array[0] < 100 && key_array[0] > 0
    assert key_array[1] < 100 && key_array[0] > 0
    assert key_array[2] < 100 && key_array[0] > 0
    assert key_array[3] < 100 && key_array[0] > 0
  end
end
