module Weather

  def weather_conditions
    rand = rand(6)+1
    rand <= 5 ? "sunny" : "stormy"  
  end

end

