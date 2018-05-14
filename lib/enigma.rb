require './lib/encrypt'
require './lib/key_generator'
# this is a comment to keep rubocop quiet
class Enigma
  def encrypt(message, key = KeyGenerator.new.rand_key,\
              date = Date.today.strftime('%m%d%y'))
              ##change the vairable name from a single letter to "new_message"
    x = Encrypt.new(message, key, date)
    x.encryptor
  end
end
