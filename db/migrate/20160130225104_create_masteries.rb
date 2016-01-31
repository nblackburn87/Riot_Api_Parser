class CreateMasteries < ActiveRecord::Migration
  def change
    create_table :masteries do |t|
      t.integer :riot_id, limit: 8
      t.string :name
      t.string :mastery_tree_name
      t.text :descriptions, array: true, default:[]
      t.string :prereq
      t.integer :ranks
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
