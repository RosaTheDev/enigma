require './test/test_helper'
require './lib/enigma'

class EnigmaTest < Minitest::Test
  def setup
    @enigma = Enigma.new('this is so secret ..end..', 32_435, '051218')
  end

  def test_enigma_exists
    assert_instance_of Enigma, @enigma
  end

  def test_enigma_takes_a_key
    assert_equal 32_435, @enigma.key
  end

  def test_enigma_takes_a_message
    assert_equal 'this is so secret ..end..', @enigma.message
  end

  def test_date
    assert_equal '051218', @enigma.date
  end

  def test_enigma_has_characters
    assert @enigma.characters.include? 'a'
    assert @enigma.characters.include? '0'
    assert @enigma.characters.include? '.'
  end

  def test_split_into_four_strings
    key_array = @enigma.split_into_four_strings

    assert_equal ['32', '24', '43', '35'], key_array
  end

  def test_change_four_strings_to_ints
    key_array = @enigma.split_into_four_strings
    key_ints = @enigma.strings_to_ints(key_array)

    assert_equal [32, 24, 43, 35], key_ints
  end

  def test_squared_date
    assert_equal 2623283524, @enigma.square_date
  end

  def test_last_four_digits_of_date_squared
    sqr_date  = @enigma.square_date
    last_four = @enigma.last_four_digits_of_date_squared(sqr_date)

    assert_equal ['3', '5', '2', '4'], last_four
  end

  def test_final_key_for_encode
    key_array = @enigma.split_into_four_strings
    key_ints  = @enigma.strings_to_ints(key_array)

    sqr_date  = @enigma.square_date
    last_four = @enigma.last_four_digits_of_date_squared(sqr_date)
    date_ints = @enigma.strings_to_ints(last_four)

    final_code_key = @enigma.final_key_for_encode(key_ints, date_ints)

    assert_equal [35, 29, 45, 39], final_code_key
  end

  def test_split_message
    expected = ["t", "h", "i", "s", " ", "i", "s", " ",\
                "s", "o", " ", "s", "e", "c", "r", "e", "t",\
                " ", ".", ".", "e", "n", "d", ".", "."]
    actual   = @enigma.split_message

    assert_equal expected, actual
  end

  def test_encrypt
    key_array = @enigma.split_into_four_strings
    key_ints  = @enigma.strings_to_ints(key_array)

    sqr_date  = @enigma.square_date
    last_four = @enigma.last_four_digits_of_date_squared(sqr_date)
    date_ints = @enigma.strings_to_ints(last_four)

    message = @enigma.split_message
    @enigma.encrypt(message, )
  end
end
