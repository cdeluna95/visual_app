class Visual < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  has_many :reviews
  has_attached_file :visual_img, :styles => { :visual_index => "250x350>", :visual_show => "325x475>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :visual_img, :content_type => /\Aimage\/.*\Z/
end
