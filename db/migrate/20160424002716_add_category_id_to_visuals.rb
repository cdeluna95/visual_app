class AddCategoryIdToVisuals < ActiveRecord::Migration
  def change
    add_column :visuals, :category_id, :integer
  end
end
