require "./test/test_helper.rb"

class EnigmaTest < Minitest::Test 
  def setup
    @enigma = Enigma.new
  end

  def test_it_exist
    assert_instance_of Enigma, @enigma
  end

  def test_encrypt_method
    expected = {encryption: "keder ohulw!", key: "02715", date: "040895"}
    assert_equal expected, @enigma.encrypt("hello world!", "02715", "040895")
  end

  def test_decrypt_method
    expected = {decryption: "hello world!", key: "02715", date: "040895"}
    assert_equal expected, @enigma.decrypt("keder ohulw!", "02715", "040895")
  end

  def test_encrypt_method_no_date
    expected = {encryption: "lfhasasdvm !", key: "02715", date: "061119"}
    assert_equal expected, @enigma.encrypt("hello world!", "02715")
  end

  def test_encrypt_method_no_date_or_key
    expected = {encryption: "lfhasasdvm !", key: "02715", date: "061119"}
    assert_instance_of Hash, @enigma.encrypt("hello world!")
    assert_equal true, @enigma.encrypt("hello world!").keys.include?(:encryption)
    assert_equal true, @enigma.encrypt("hello world!").keys.include?(:key)
    assert_equal true, @enigma.encrypt("hello world!").keys.include?(:date)
  end
end