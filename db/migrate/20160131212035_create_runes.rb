class CreateRunes < ActiveRecord::Migration
  def change
    create_table :runes do |t|
      t.integer :riot_id, limit: 8
      t.string :name
      t.string :description
      t.integer :rune_tier
      t.string :image_full
      t.string :image_group
      t.string :image_sprite
      t.integer :image_h
      t.integer :image_w
      t.integer :image_x
      t.integer :image_y
    end
  end
end
