class AddUserIdToVisuals < ActiveRecord::Migration
  def change
    add_column :visuals, :user_id, :integer
  end
end
