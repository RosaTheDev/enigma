require './test/test_helper'
require './lib/decrypt'

class DecryptTest < Minitest::Test
  def setup
    @decrypt = Decrypt.new('p os6.y oedsa5xep0e.adj.7', 32_435, '051218')
  end

  def test_decrypt_exists
    assert_instance_of Decrypt, @decrypt
  end

  def test_decrypt_takes_a_key
    assert_equal 32_435, @decrypt.key
  end

  def test_decrypt_takes_a_message
    assert_equal 'p os6.y oedsa5xep0e.adj.7', @decrypt.message
  end

  def test_date
    assert_equal '051218', @decrypt.date
  end

  def test_decrypt_has_characters
    # skip
    assert @decrypt.characters.include? 'a'
    assert @decrypt.characters.include? '0'
    assert @decrypt.characters.include? '.'
  end

  def test_split_into_four_strings
    # skip
    key_array = @decrypt.split_into_four_strings

    assert_equal ['32', '24', '43', '35'], key_array
  end

  def test_change_four_strings_to_ints
    # skip
    key_array = @decrypt.split_into_four_strings
    key_ints = @decrypt.strings_to_ints(key_array)

    assert_equal [32, 24, 43, 35], key_ints
  end

  def test_squared_date
    # skip
    assert_equal 2_623_283_524, @decrypt.square_date
  end

  def test_last_four_digits_of_date_squared
    # skip
    sqr_date  = @decrypt.square_date
    last_four = @decrypt.last_four_digits_of_date_squared(sqr_date)

    assert_equal ['3', '5', '2', '4'], last_four
  end

  def test_final_key_for_encode
    # skip
    key_array = @decrypt.split_into_four_strings
    key_ints  = @decrypt.strings_to_ints(key_array)

    sqr_date  = @decrypt.square_date
    last_four = @decrypt.last_four_digits_of_date_squared(sqr_date)
    date_ints = @decrypt.strings_to_ints(last_four)

    final_code_key = @decrypt.final_key_for_encode(key_ints, date_ints)

    assert_equal [35, 29, 45, 39], final_code_key
  end

  def test_split_message
    # skip
    expected = ["p", " ", "o", "s", "6", ".",\
                "y", " ", "o", "e", "d", "s",\
                "a", "5", "x", "e", "p", "0",\
                "e", ".", "a", "d", "j", ".","7"]
    actual   = @decrypt.split_message

    assert_equal expected, actual
  end

  def test_decryptor
    assert_equal 'this is so secret ..end..', @decrypt.decryptor
  end
end
