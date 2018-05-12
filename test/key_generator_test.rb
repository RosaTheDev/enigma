require_relative 'test_helper'
require './lib/key_generator'
class KeyGeneratorTest < Minitest::Test
  def test_key_generator_exists
    key_gen = KeyGenerator.new
    assert_instance_of KeyGenerator, key_gen
  end

  def test_key
    key_gen = KeyGenerator.new
    assert key_gen.key < 100000 && key_gen.key > 9999
  end

  def test_date
    key_gen = KeyGenerator.new

    assert_equal '05-11-2018', key_gen.date
  end

  def test_split_key_into_four_ints
    key_gen = KeyGenerator.new

    assert_equal 4, key_gen.split_key.length
  end

  def test_each_split_key_is_between_0_and_100
    key_gen = KeyGenerator.new

    assert key_gen.split
  end
end
