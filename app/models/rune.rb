class Rune < ActiveRecord::Base
  include HTTParty

  base_uri "https://na.api.pvp.net/api/lol"

  logger ::Logger.new("httparty.log"), :debug, :curl

  def self.rebuild_runes_from_api!
    response = get("/static-data/na/v1.2/rune?api_key=#{Rails.application.secrets.riot_api_key}&runeListData=all")

    if response.success?
      response.parsed_response["data"].each do |_, rune_attrs|
        binding.pry unless rune_attrs.key? "id"
        rune = Rune.where(riot_id: rune_attrs["id"]).first_or_initialize

        rune.assign_attributes(
          name: rune_attrs["name"],
          description: rune_attrs["description"],
          rune_tier: rune_attrs["rune"]["tier"],
          image_full: rune_attrs["image"]["full"],
          image_group: rune_attrs["image"]["group"],
          image_sprite: rune_attrs["image"]["sprite"],
          image_h: rune_attrs["image"]["h"],
          image_w: rune_attrs["image"]["w"],
          image_x: rune_attrs["image"]["x"],
          image_y: rune_attrs["image"]["y"]
        )

        if rune.changed?
          rune.save!
        end
      end
    else
      raise response.response.code + " " + response.response.message
    end
  end
end