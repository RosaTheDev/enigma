require './test/test_helper'
require './lib/enigma'

class EnigmaTest < Minitest::Test
  def setup
    @enigma = Enigma.new([5, 7, 2, 4])
  end

  def test_enigma_exists
    assert_instance_of Enigma, @enigma
  end

  def test_enigma_takes_a_key
    assert_equal [5, 7, 2, 4], @enigma.key
  end

  def test_enigma_has_characters
    assert @enigma.characters.include? "a"
    assert @enigma.characters.include? "0"
    assert @enigma.characters.include? "."
  end
end
