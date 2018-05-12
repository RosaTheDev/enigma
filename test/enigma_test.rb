require './test/test_helper'
require './lib/enigma'

class EnigmaTest < Minitest::Test
  def setup
    @enigma = Enigma.new()
  end

  def test_enigma_exists
    assert_instance_of Enigma, @enigma
  end

  def test_encode_a_letter
  end
end
