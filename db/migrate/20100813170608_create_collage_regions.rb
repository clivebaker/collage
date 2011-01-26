class CreateCollageRegions < ActiveRecord::Migration
  def self.up
    create_table :collage_regions do |t|
      t.string :name
      t.integer :top
      t.integer :left
      t.integer :width
      t.integer :height
      t.integer :collage_template_id

      t.timestamps
    end
  end

  def self.down
    drop_table :collage_regions
  end
end
