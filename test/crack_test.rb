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
    assert_equal [".", "b", "l", "4"], last_four
  end

  def test_compare_encrypted_chars_with_known_end_chars
    last_four = @crack.last_four_chars_of_encryption_into_array
    encrypt_nums = @crack.compare_chars_with_known_end(last_four)

    assert_equal [15, 2, 26, 7], encrypt_nums
  end
end
