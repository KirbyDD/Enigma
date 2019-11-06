module Encryption

  def today
    time = Time.new
    time.strftime("%d/%m/%y").gsub("/", "")
  end

  def create_key
    rand.to_s.gsub(".", "")[0..4]
  end

  def create_offset date
    (date.to_i ** 2).to_s.split('').reverse.slice(0,4).reverse
  end

  def make_char_array
    ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "]
  end

  def create_shift_array key, offset
    work_array = ["#{key[0]}" + "#{key[1]}", "#{key[1]}" + "#{key[2]}","#{key[2]}" + "#{key[3]}", "#{key[3]}" + "#{key[4]}"]
    shift_array = [work_array[0].to_i + offset[0].to_i, work_array[1].to_i + offset[1].to_i, work_array[2].to_i + offset[2].to_i, work_array[3].to_i + offset[3].to_i]
  end
end

