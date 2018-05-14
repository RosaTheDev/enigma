require './test/test_helper'
require './lib/enigma'

class EnigmaTest < Minitest::Test
  def setup
    @e = Enigma.new
  end

  def test_enigma_exists
    assert_instance_of Enigma, @e
  end

  def test_spec_interaction_for_enigma
    expected = 'p os6.y oedsa5xep0e.adj.7'
    actual   = @e.encrypt('this is so secret ..end..',\
               32_435, '051218')

    assert_equal expected, actual
  end
end
