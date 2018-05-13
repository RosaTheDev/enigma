# this is our encryptor class
class Decryptor
  attr_reader :key,
              :message,
              :date,
              :characters

  def initialize(message = nil, key = nil,\
                 date = Date.today.strftime('%m%d%y'))
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

  def split_into_four_strings
    key = []
    split_array = @key.to_s.split('')
    split_array.each_index do |i|
      if i == 4
        i
      else
        key << split_array[i] + split_array[i + 1]
      end
    end
    key
  end

  def strings_to_ints(key_array)
    key_array.map do |string|
      string.to_i
    end
  end

  def square_date
    @date.to_i**2
  end

  def last_four_digits_of_date_squared(sqrt_date)
    sqrt_date.to_s[-4..-1].chars
  end

  def final_key_for_encode(key_int, date_ints)
    final_code = []
    key_int.each_index do |index|
      final_code << key_int[index] + date_ints[index]
    end
    final_code
  end

  def split_message
    @message.chars
  end

  def encrypt(message, key_ints, date_ints)
    encoded = []
    message_enum = message.to_enum
    final_key = final_key_for_encode(key_ints, date_ints)
    loop do
      letter = message_enum.next
      x = @characters.rotate(@characters.index(letter) - final_key[0])
      encoded << x[0]
      final_key.rotate!
    end
    encoded.join
  end
end
