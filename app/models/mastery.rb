class Mastery < ActiveRecord::Base
  include HTTParty

  base_uri "https://na.api.pvp.net/api/lol"

  logger ::Logger.new("httparty.log"), :debug, :curl

  def self.rebuild_masteries_from_api!
    response = get("/static-data/na/v1.2/mastery?api_key=#{Rails.application.secrets.riot_api_key}&masteryListData=all")

    if response.success?
      response.parsed_response["data"].each do |_, mastery_attrs|
        binding.pry unless mastery_attrs.key? "id"
        mastery = Mastery.where(riot_id: mastery_attrs["id"]).first_or_initialize

        mastery.assign_attributes(
          name: mastery_attrs["name"],
          mastery_tree_name: mastery_attrs["masteryTree"],
          descriptions: mastery_attrs["description"],
          prereq: mastery_attrs["prereq"],
          ranks: mastery_attrs["ranks"],
          image_full: mastery_attrs["image"]["full"],
          image_group: mastery_attrs["image"]["group"],
          image_sprite: mastery_attrs["image"]["sprite"],
          image_h: mastery_attrs["image"]["h"],
          image_w: mastery_attrs["image"]["w"],
          image_x: mastery_attrs["image"]["x"],
          image_y: mastery_attrs["image"]["y"]
        )

        if mastery.changed?
          mastery.save!
        end
      end
    else
      raise response.response.code + " " + response.response.message
    end
  end
end