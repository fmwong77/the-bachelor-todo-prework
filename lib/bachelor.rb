require 'pry'

def get_first_name_of_season_winner(data, season)
  name = ""
  girls = data.fetch("#{season}")
  girls.each do |girl|
    if girl["status"] == "Winner"
      name = (girl["name"].split(" "))[0]
    end 
  end
  name
end

def get_contestant_name(data, occupation)
  data.each do |season, girls|
    girls.each do |attribute|
      if attribute[:occupation] == occupation
        return attribute[:name]
      end 
    end
  end
end

def count_contestants_by_hometown(data, hometown)
  counter = 0
  data.each do |season, girls|
    girls.each do |attribute|
      if attribute[:hometown] == hometown
        counter += 1
      end 
    end
  end

  counter
end

def get_occupation(data, hometown)
  data.each do |season, girls|
    girls.each do |attribute|
      if attribute[:hometown] == hometown
        return attribute[:occupation]
      end 
    end
  end
end

def get_average_age_for_season(data, season)
  total_age = 0
  
  data[:"#{season}"].each do |contestant|
    total_age += contestant[:age].to_i
  end
  average = total_age.to_f/data[:"#{season}"].length
  average.round
end
