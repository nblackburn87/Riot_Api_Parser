class RiotApi
  require 'logger'
  include HTTParty

  base_uri "https://na.api.pvp.net/api/lol"

  logger ::Logger.new("httparty.log"), :debug, :curl

  def self.find(name)
    response = get("/na/v1.4/summoner/by-name/#{name}?api_key=#{Rails.application.secrets.riot_api_key}")

    if response.success?
      Summoner.new(id: response[name]["id"], name: response[name]["name"],
        profile_icon_id: response[name]["profileIconId"], summoner_level: response[name]["summonerLevel"],
        revision_date: response[name]["revisionDate"])
    else
      raise response.response.code + " " + response.response.message
    end
  end
end


