module Cracking
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

  def split_message
    @message.chars
  end
end
