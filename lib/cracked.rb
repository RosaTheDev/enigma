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

  def cracker
    last_four = last_four_chars_of_encryption_into_array

    comparison = compare_chars_with_known_end(last_four)

    final_key = rotate_encryption_shift_to_actual_order(comparison)

    encoded = []

    message_enum = split_message.to_enum
    loop do
      letter = message_enum.next
      char_rotate = @characters.rotate(@characters.index(letter) + final_key[0])
      encoded << char_rotate[0]
      final_key.rotate!
    end
    encoded.join
  end
end
