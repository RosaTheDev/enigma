require './lib/key_generator'
require './lib/encrypt'
require './lib/decrypt'
# this is a comment to keep rubocop quiet
class Enigma
  def encrypt(message, key = KeyGenerator.new.rand_key,\
              date = Date.today.strftime('%m%d%y'))
<<<<<<< HEAD
              ##change the vairable name from a single letter to "new_message"
=======

>>>>>>> b0be06b0a69c9c48cbc602637d1d9368e930ff6e
    x = Encrypt.new(message, key, date)
    x.encryptor
  end

  def decrypt(message, key, date)

    x = Decrypt.new(message, key, date)
    x.decryptor
  end
end
