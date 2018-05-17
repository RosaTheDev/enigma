require './lib/methods_for_encryptor_and_decryptor'
# this is our encryptor class
class Encryptor
  include MethodsForEncAndDec
  attr_reader :key,
              :message,
              :date,
              :characters
  def initialize(message = nil, key = nil,\
    date = Date.today.strftime('%d%m%y'))
    @message    = message
    @key        = key
    @date       = date
    @characters = ['a', 'b', 'c', 'd', 'e', 'f', 'g',\
                   'h', 'i', 'j', 'k', 'l', 'm', 'n',\
                   'o', 'p', 'q', 'r', 's', 't', 'u',\
                   'v', 'w', 'x', 'y', 'z', '0', '1',\
                   '2', '3', '4', '5', '6', '7', '8',\
                   '9', ' ', '.', ',']
  end

  def encryptor_loop(message_enum, final_key)
    encoded = []
    loop do
      letter = message_enum.next
      char_rotate = @characters.rotate(@characters.index(letter) + final_key[0])
      encoded << char_rotate[0]
      final_key.rotate!
    end
    encoded.join
  end

  def encryptor
    key_array      = split_into_four_strings
    key_ints       = strings_to_ints(key_array)

    sqr_date       = square_date
    last_four      = last_four_digits_of_date_squared(sqr_date)
    date_ints      = strings_to_ints(last_four)

    final_key      = final_key_for_encode(key_ints, date_ints)

    message_enum   = split_message.to_enum

    return encryptor_loop(message_enum, final_key)
  end
end
