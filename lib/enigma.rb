require './lib/key_generator'
require './lib/encrypt'
require './lib/decrypt'
require './lib/crack'
# this is a comment to keep rubocop quiet
class Enigma
  def encrypt(message, key, date)
    x = Encrypt.new(message, key, date)
    x.encryptor
  end

  def decrypt(message, key, date)
    x = Decrypt.new(message, key, date)
    x.decryptor
  end

  def crack(message, key, date)
    x = Crack.new(message, key, date)
    x.cracker
  end
end
