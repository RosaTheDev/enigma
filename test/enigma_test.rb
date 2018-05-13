require './test/test_helper'
require './lib/enigma'

class EnigmaTest < Minitest::Test
  def setup
    @e = Enigma.new
  end

  def test_enigma_exists
    assert_instance_of Enigma, @e
  end

  def test_enigma_has_encryptor
    assert_instance_of Encryptor, @e.encryptor
  end

end
