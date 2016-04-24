class CreateVisuals < ActiveRecord::Migration
  def change
    create_table :visuals do |t|
      t.string :title
      t.text :description
      t.string :creator

      t.timestamps null: false
    end
  end
end
