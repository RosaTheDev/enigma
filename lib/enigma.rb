require './lib/key_generator'
require './lib/encryptor'
require './lib/decryptor'
require './lib/cracked'
require 'date'
# this is a comment to keep rubocop quiet
class Enigma
  attr_reader :key, :date

  def initialize(key = nil, date = nil)
    @key = key
    @date = date

  end
  def encrypt(message, key = KeyGenerator.new.rand_key,\
              date = Date.today.strftime('%d%m%y'))
    enigma = Encrypt.new(message, key, date)
    @key = key
    @date = date
    enigma.encryptor
  end

  def decrypt(message, key, date)
    alan_turing = Decrypt.new(message, key, date)
    alan_turing.decryptor
  end

  def crack(message, key, date)
    alan_turing = Cracked.new(message, key, date)
    alan_turing.cracker
  end
end
