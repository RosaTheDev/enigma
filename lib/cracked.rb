require './lib/methods_for_the_crack'
# crack
class Cracked
  include Cracking
  attr_reader :key,
              :message,
              :date,
              :characters

  def initialize(message, key, date)
    @message    = message
    @date       = date
    @key        = key
    @actual_end = 'nd..'
    @characters = ['a', 'b', 'c', 'd', 'e', 'f', 'g',\
                   'h', 'i', 'j', 'k', 'l', 'm', 'n',\
                   'o', 'p', 'q', 'r', 's', 't', 'u',\
                   'v', 'w', 'x', 'y', 'z', '0', '1',\
                   '2', '3', '4', '5', '6', '7', '8',\
                   '9', ' ', '.', ',']
  end

  def crack_message_loop(message, final_key)
    encoded = []
    loop do
      letter  = message.next
      cracked = @characters.rotate(@characters.index(letter) + final_key[0])
      encoded <<  cracked[0]
      final_key.rotate!
    end
    encoded.join
  end

  def cracker
    a = last_four_chars_of_encryption_into_array
    b = compare_chars_with_known_end(a)
    final_key = rotate_encryption_shift_to_actual_order(b)

    message = split_message.to_enum

    return crack_message_loop(message, final_key)
  end
end
