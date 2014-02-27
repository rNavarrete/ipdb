class Podcast < ActiveRecord::Base
	belongs_to :user
	has_attached_file :image, :styles => {:medium => "250x250", :thumb => "100x100>"}
	validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
	acts_as_commontable
	letsrate_rateable
end
