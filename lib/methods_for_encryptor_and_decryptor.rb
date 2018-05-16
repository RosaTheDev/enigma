module MethodsForEncAndDec
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
    final_code = []
    key_int.each_index do |index|
      final_code << key_int[index] + date_ints[index]
    end
      final_code
  end

  def split_message
      @message.chars
  end

  def message_enum
    split_message.to_enum
  end
end
