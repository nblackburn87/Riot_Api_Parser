class SummonerSerializer < ActiveModel::Serializer
  attributes :id, :name, :profileIconId, :revisionDate, :summonerLevel
end
