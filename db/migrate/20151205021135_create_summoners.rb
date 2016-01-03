class CreateSummoners < ActiveRecord::Migration
  def change
    create_table :summoners do |t|
      t.string :name
      t.integer :profileIconId
      t.integer :revisionDate
      t.integer :summonerLevel

      t.timestamps
    end
  end
end
