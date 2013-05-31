module Weather

  def weather_conditions
    rand = rand(6)+1
    if rand <= 5
      "sunny"
    else
      "stormy"
    end    
  end

end