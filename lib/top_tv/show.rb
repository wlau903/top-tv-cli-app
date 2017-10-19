class TopTv::Show
  attr_accessor :name, :tomato_meter, :meter_score, :url, :heading

  @@all = []

  def initialize(name, tomato_meter, meter_score, url)
    @name = name
    @tomato_meter = tomato_meter
    @meter_score = meter_score
    @url = url
  end

end
