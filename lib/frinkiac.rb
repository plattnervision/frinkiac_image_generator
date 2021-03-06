require 'HTTParty'

class RandomFrinkJson #generate a random json
  attr_reader :frinkjson
  def initialize
    @frinkjson = frinkjson
  end

  def frinkjson
    HTTParty.get("https://frinkiac.com/api/random")
  end

end

class RandomFrinkImage # generate image url
  attr_reader :frink_url_random_values, :frink_image_url
  def initialize(args)
    @frink_url_random_values = urlify(args[:data])
    @frink_image_url = frink_image_url
  end

  def frink_image_url
    "https://frinkiac.com/img/#{frink_url_random_values.episode}/#{frink_url_random_values.timestamp}.jpg"
  end

  UrlVariables = Struct.new(:episode, :timestamp)
  def urlify(data)
      UrlVariables.new(data["Frame"]["Episode"],data["Frame"]["Timestamp"])
  end
end
