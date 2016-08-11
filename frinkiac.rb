require 'HTTParty'
require 'pry'

random_frink = "https://frinkiac.com/api/random"
# need to parse this response for
## response[“Frame”][“Episode”]
## response[“Frame”][“Timestamp”]

#frink_image_url = "https://frinkiac.com/img/#{episode}/#{timestamp}.jpg"



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

class FrinkImages
  attr_reader :frink_image_url
  def initialize(args)
  end

end

c =  RandomFrinkImage.new(
  :data => RandomFrinkJson.new.frinkjson)
binding.pry

# class FrinkImage # parse ye ol ruby image
#
# UrlVariables = Struct.new(:episode, :timestamp)
#   def urlify(data)
#     data.collect {|cell|
#       UrlVariables.new(cell["Frame"]["Episode"],cell["Frame"]["Timestamp"])}
#   end
# end
