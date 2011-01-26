class CreateCollageTemplates < ActiveRecord::Migration
  def self.up
    create_table :collage_templates do |t|
      t.string :name
      t.string :background

      t.timestamps
    end
  end

  def self.down
    drop_table :collage_templates
  end
end
