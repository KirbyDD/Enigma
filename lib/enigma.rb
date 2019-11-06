require_relative './encrypt.rb'
require_relative './decrypt.rb'
require_relative './encryption_module.rb'

class Enigma
  include Encryption

  def encrypt(msg, key = create_key, date = today)
    result = Encrypt.new(msg, key, date)
    result.create_encryption
  end

  def decrypt(msg, key, date = today)
    result = Decrypt.new(msg, key, date)
    result.decrypt_msg
  end
end