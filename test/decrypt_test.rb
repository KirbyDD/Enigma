require "./test/test_helper.rb"


class DecryptTest < Minitest::Test 
  def setup
    @decrypt = Decrypt.new("keder ohulw", "02715", "040895")
  end

  def test_it_exist
    assert_instance_of Decrypt, @decrypt
  end

  def test_it_has_attributes
    assert_equal "keder ohulw",  @decrypt.msg
    assert_equal "02715",  @decrypt.key
    assert_equal "040895",  @decrypt.date
  end

  def test_decrypt_method
    expected = {decryption: "hello world", key: "02715", date: "040895"}
    assert_equal expected, @decrypt.decrypt_msg
  end
end