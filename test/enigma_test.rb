require './test/test_helper'
require './lib/enigma'

class EnigmaTest < Minitest::Test
  def setup
    @e = Enigma.new
  end

  def test_enigma_exists
    assert_instance_of Enigma, @e
  end

  def test_spec_interaction_for_enigma_to_encrypt
    expected = 'p os6.y oedsa5xep0e.adj.7'
    actual   = @e.encrypt('this is so secret ..end..',\
                          32_435, '051218')

    assert_equal expected, actual
  end

  def test_spec_interaction_for_enigma_to_decrypt
    expected = 'this is so secret ..end..'
    actual   = @e.decrypt('p os6.y oedsa5xep0e.adj.7',\
                          32_435, '051218')

    assert_equal expected, actual
  end

  def test_spec_interaction_for_enigma_to_crack
    expected = 'this is so secret ..end..'
    actual   = @e.crack('p os6.y oedsa5xep0e.adj.7',\
                        32_435, '051218')

    assert_equal expected, actual
  end
end
