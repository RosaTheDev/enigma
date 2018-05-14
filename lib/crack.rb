class Crack
  attr_reader :key,
              :message,
              :date,
              :characters

  def initialize(message, key, date)
    @message    = message
    @date       = date
    @actual_end = 'nd..'
    @characters = ['a', 'b', 'c', 'd', 'e', 'f', 'g',\
                   'h', 'i', 'j', 'k', 'l', 'm', 'n',\
                   'o', 'p', 'q', 'r', 's', 't', 'u',\
                   'v', 'w', 'x', 'y', 'z', '0', '1',\
                   '2', '3', '4', '5', '6', '7', '8',\
                   '9', ' ', '.', ',']
  end

  def last_four_chars_of_encryption_into_array
    @message[-4..-1].chars
  end

  def compare_chars_with_known_end(encrypted_end)
    encrypted_end.map.with_index do |letter, index|
      @characters.rotate(@characters.index(letter)).index(@actual_end[index])
    end
  end
end
