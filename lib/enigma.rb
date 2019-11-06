require_relative './encrypt.rb'
require_relative './encryption_module.rb'

class Enigma
  include Encryption

  def encrypt(msg, key, date = today)
    result = Encrypt.new(msg, key, date)
    result.create_encryption
  end

end

# enigma = Enigma.new

# p enigma.encrypt("hello world!", "02715", "040895")