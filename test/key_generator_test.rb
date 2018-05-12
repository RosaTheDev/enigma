require_relative 'test_helper'
require './lib/key_generator'
class KeyGeneratorTest < Minitest::Test
  def test_key_generator_exists
    key_gen = KeyGenerator.new
    assert_instance_of KeyGenerator, key_gen
  end

  def test_key
    key_gen = KeyGenerator.new
    assert key_gen.key < 100_000 && key_gen.key > 9_999
  end
end
