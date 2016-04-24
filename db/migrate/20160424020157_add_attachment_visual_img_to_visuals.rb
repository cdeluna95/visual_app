class AddAttachmentVisualImgToVisuals < ActiveRecord::Migration
  def self.up
    change_table :visuals do |t|
      t.attachment :visual_img
    end
  end

  def self.down
    remove_attachment :visuals, :visual_img
  end
end
