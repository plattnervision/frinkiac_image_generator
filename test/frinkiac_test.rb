require 'minitest/autorun'
require_relative '../lib/frinkiac.rb'

class FrinkiacTest < MiniTest::Test

  def setup
    @frinkiacjson = RandomFrinkJson.new
    @frinkiac_url = RandomFrinkImage.new(:data => RandomFrinkJson.new.frinkjson)
  end

  def test_frinkiac_not_nil
    assert @frinkiacjson != nil
  end

  def test_for_url
    random_image = @frinkiac_url
    assert_match /https:\/\/frinkiac.com\/img/, random_image.frink_image_url
  end

end
