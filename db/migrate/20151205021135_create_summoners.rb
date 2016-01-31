class CreateSummoners < ActiveRecord::Migration
  def change
    create_table :summoners do |t|
      t.string :name
      t.integer :profile_icon_id
      t.integer :revision_date, limit: 8
      t.integer :summoner_level

      t.timestamps
    end
  end
end
