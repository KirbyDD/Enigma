require_relative './encryption_module.rb'

class Decrypt
  include Encryption
  attr_reader :msg, :key, :date
  def initialize(msg, key, date)
    @msg = msg
    @key = key 
    @date = date
  end

  def decrypt_msg
    offset = self.create_offset(@date)
    shift_array = create_shift_array(@key, offset)
    char_array = make_char_array
    iter = 0
    result = []
    @msg.each_char do |char|
      if !char_array.include?(char)
        result << char
      else
        adjust = char_array.index(char) - shift_array[iter] 
        # require "pry"; binding.pry
        if adjust > -27
          result << char_array[adjust]
        else
          num = (adjust.abs % 27) * -1
          result << char_array[num]
        end
        iter += 1
        if iter > 3
          iter = 0
        end
      end
    end
    {decryption: result.join(""), key: @key, date: @date}
  end
end