class RiotApi
  require 'logger'
  include HTTParty

  base_uri "https://na.api.pvp.net/api/lol"

  logger ::Logger.new("httparty.log"), :debug, :curl

  attr_accessor :id, :name, :profileIconId, :summonerLevel, :revisionDate

  def initialize(id, name, profileIconId, summonerLevel, revisionDate)
    self.id = id
    self.name = name
    self.profileIconId = profileIconId
    self.summonerLevel = summonerLevel
    self.revisionDate = revisionDate
  end

  def self.find(name)
    response = get("/na/v1.4/summoner/by-name/#{name}?api_key=#{Rails.application.secrets.riot_api_key}")

    if response.success?
      self.new(response[name]["id"], response[name]["name"], response[name]["profileIconId"],
        response[name]["summonerLevel"], response[name]["revisionDate"])
    else
      raise response.response.code + " " + response.response.message
    end
  end

end


