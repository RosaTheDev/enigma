require './test/test_helper'
require './lib/encryptor'

class EncryptTest < Minitest::Test
  def setup
    @encrypt = Encrypt.new('my name is jeff ..end..', 32_435, '051218')
  end

  def test_encrypt_exists
    assert_instance_of Encrypt, @encrypt
  end

  def test_encrypt_takes_a_key
    assert_equal 32_435, @encrypt.key
  end

  def test_encrypt_takes_a_message
    assert_equal 'my name is jeff ..end..', @encrypt.message
  end

  def test_date
    assert_equal '051218', @encrypt.date
  end

  def test_encrypt_has_characters
    # skip
    assert @encrypt.characters.include? 'a'
    assert @encrypt.characters.include? '0'
    assert @encrypt.characters.include? '.'
  end

  def test_split_into_four_strings
    # skip
    key_array = @encrypt.split_into_four_strings
    assert_equal %w[32 24 43 35], key_array
  end

  def test_change_four_strings_to_ints
    # skip
    key_array = @encrypt.split_into_four_strings
    key_ints = @encrypt.strings_to_ints(key_array)

    assert_equal [32, 24, 43, 35], key_ints
  end

  def test_squared_date
    # skip
    assert_equal 2_623_283_524, @encrypt.square_date
  end

  def test_last_four_digits_of_date_squared
    # skip
    sqr_date  = @encrypt.square_date
    last_four = @encrypt.last_four_digits_of_date_squared(sqr_date)

    assert_equal %w[3 5 2 4], last_four
  end

  def test_final_key_for_encode
    # skip
    key_array = @encrypt.split_into_four_strings
    key_ints  = @encrypt.strings_to_ints(key_array)

    sqr_date  = @encrypt.square_date
    last_four = @encrypt.last_four_digits_of_date_squared(sqr_date)
    date_ints = @encrypt.strings_to_ints(last_four)

    final_code_key = @encrypt.final_key_for_encode(key_ints, date_ints)

    assert_equal [35, 29, 45, 39], final_code_key
  end

  def test_split_message
    # skip
    expected = ['m', 'y', ' ', 'n', 'a', 'm', 'e', ' ',\
                'i', 's', ' ', 'j', 'e', 'f', 'f', ' ',\
                '.', '.', 'e', 'n', 'd', '.', '.']
    actual   = @encrypt.split_message

    assert_equal expected, actual
  end

  def test_encryptor
    assert_equal 'iodn9ck eidja8l 71kn,1e', @encrypt.encryptor
  end
end
