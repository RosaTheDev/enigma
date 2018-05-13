require './test/test_helper'
require './lib/encryptor'

class EncryptorTest < Minitest::Test
  def setup
    @encryptor = Encryptor.new('this is so secret ..end..', 32_435, '051218')
  end

  def test_enigma_exists
    assert_instance_of Encryptor, @encryptor
  end

  def test_enigma_takes_a_key
    assert_equal 32_435, @encryptor.key
  end

  def test_enigma_takes_a_message
    assert_equal 'this is so secret ..end..', @encryptor.message
  end

  def test_date
    assert_equal '051218', @encryptor.date
  end

  def test_enigma_has_characters
    assert @encryptor.characters.include? 'a'
    assert @encryptor.characters.include? '0'
    assert @encryptor.characters.include? '.'
  end

  def test_split_into_four_strings
    key_array = @encryptor.split_into_four_strings

    assert_equal ['32', '24', '43', '35'], key_array
  end

  def test_change_four_strings_to_ints
    key_array = @encryptor.split_into_four_strings
    key_ints = @encryptor.strings_to_ints(key_array)

    assert_equal [32, 24, 43, 35], key_ints
  end

  def test_squared_date
    assert_equal 2623283524, @encryptor.square_date
  end

  def test_last_four_digits_of_date_squared
    sqr_date  = @encryptor.square_date
    last_four = @encryptor.last_four_digits_of_date_squared(sqr_date)

    assert_equal ['3', '5', '2', '4'], last_four
  end

  def test_final_key_for_encode
    key_array = @encryptor.split_into_four_strings
    key_ints  = @encryptor.strings_to_ints(key_array)

    sqr_date  = @encryptor.square_date
    last_four = @encryptor.last_four_digits_of_date_squared(sqr_date)
    date_ints = @encryptor.strings_to_ints(last_four)

    final_code_key = @encryptor.final_key_for_encode(key_ints, date_ints)

    assert_equal [35, 29, 45, 39], final_code_key
  end

  def test_split_message
    expected = ["t", "h", "i", "s", " ", "i", "s", " ",\
                "s", "o", " ", "s", "e", "c", "r", "e", "t",\
                " ", ".", ".", "e", "n", "d", ".", "."]
    actual   = @encryptor.split_message

    assert_equal expected, actual
  end

  def test_encrypt
    key_array = @encryptor.split_into_four_strings
    key_ints  = @encryptor.strings_to_ints(key_array)

    sqr_date  = @encryptor.square_date
    last_four = @encryptor.last_four_digits_of_date_squared(sqr_date)
    date_ints = @encryptor.strings_to_ints(last_four)

    message = @encryptor.split_message
    secret_message = @encryptor.encrypt(message, key_ints, date_ints)

    assert_equal "p os6.y oedsa5xep0e.adj.7", secret_message
  end
end
