require './test/test_helper'
require './lib/enigma'

class EnigmaTest < Minitest::Test
  def setup
    @e = Enigma.new
  end

  def test_enigma_exists
    assert_instance_of Enigma, @e
  end

  def test_what_the_fuck
    assert_equal "p os6.y oedsa5xep0e.adj.7", @e.encrypt('this is so secret ..end..', 32_435, '051218')
  end
end
