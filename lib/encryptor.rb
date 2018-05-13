class Encryptor
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
end
