module MethodsForEncAndDec

  def key_array
    split_into_four_strings
    # require'pry';binding.pry
  end

  def key_ints
    strings_to_ints(key_array)
  end

  def sqr_date
    square_date
  end

  def last_four
    last_four_digits_of_date_squared(sqr_date)
  end

  def date_ints
    strings_to_ints(last_four)
  end

##map
# These are methods for encrypt and decrypt
  def split_into_four_strings
    key = []
    split_array = @key.to_s.split('')
    split_array.each_index do |index|
      if index == 4
        index
      else
        key << split_array[index] + split_array[index + 1]
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
    key_int.map.with_index do |key, index|
      key_int[index] + date_ints[index]
    end

    # final_code = []
    # key_int.each_index do |index|
    #   final_code << key_int[index] + date_ints[index]
    # end
    # final_code
  end

  def split_message
    @message.chars
  end

  def message_enum
    split_message.to_enum
  end

# These are methods for crack
  def last_four_chars_of_encryption_into_array
    @message[-4..-1].chars
  end

  def compare_chars_with_known_end(encrypted_end)
    encrypted_end.map.with_index do |letter, index|
      @characters.rotate(@characters.index(letter)).index(@actual_end[index])
    end
  end

  def rotate_encryption_shift_to_actual_order(encrypt_nums)
    encrypt_nums.rotate(- (@message.length - 4))
  end

end
