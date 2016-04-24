class AddVisualIdToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :visual_id, :integer
  end
end
