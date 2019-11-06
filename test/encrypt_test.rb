require "./test/test_helper.rb"

class EncryptTest < Minitest::Test 
  def setup
    @encrypt = Encrypt.new("hello world!", "02715", "040895")
  end

  def test_it_exist
    assert_instance_of Encrypt, @encrypt
  end

  def test_it_has_attributes
    assert_equal "hello world!",  @encrypt.msg
    assert_equal "02715",  @encrypt.key
    assert_equal "040895",  @encrypt.date
  end

  def test_encrypt_method
    expected = {encryption: "keder ohulw!", key: "02715", date: "040895"}
    assert_equal expected, @encrypt.create_encryption
  end
end