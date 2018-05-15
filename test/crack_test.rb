require './test/test_helper'
require './lib/crack'

class CrackTest < Minitest::Test
  def setup
    @crack = Crack.new('p os6.y oedsa5xep0e.adj.7',\
                       32_435, '051218')
  end

  def test_crack_exists
    assert_instance_of Crack, @crack
  end

  def test_crack_takes_a_message
    assert_equal 'p os6.y oedsa5xep0e.adj.7', @crack.message
  end

  def test_crack_takes_a_date
    assert_equal '051218', @crack.date
  end

  def test_crack_has_characters
    assert @crack.characters.include? 'a'
    assert @crack.characters.include? '0'
    assert @crack.characters.include? '.'
  end

  def test_last_four_chars_of_encryption_into_array
    last_four = @crack.last_four_chars_of_encryption_into_array
    assert_equal ["d", "j", ".", "7"], last_four
  end

  def test_compare_encrypted_chars_with_known_end_chars
    last_four = @crack.last_four_chars_of_encryption_into_array
    encrypt_nums = @crack.compare_chars_with_known_end(last_four)

    assert_equal [10, 33, 0, 4], encrypt_nums
  end

  def test_rotate_encryption_shift_to_actual_order
    last_four = @crack.last_four_chars_of_encryption_into_array
    encrypt_nums = @crack.compare_chars_with_known_end(last_four)
    actual_order = @crack.rotate_encryption_shift_to_actual_order(encrypt_nums)

    assert_equal [4, 10, 33, 0], actual_order
  end
  
  def test_split_message
    expected = ["p", " ", "o", "s", "6", ".",\
                "y", " ", "o", "e", "d", "s",\
                "a", "5", "x", "e", "p", "0",\
                "e", ".", "a", "d", "j", ".","7"]
    actual   = @crack.split_message

    assert_equal expected, actual
  end

  def test_crack
    assert_equal 'this is so secret ..end..', @crack.cracker
  end
end
