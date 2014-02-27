class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :podcasts
  has_attached_file :profile_image, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  validates_attachment_content_type :profile_image, :content_type => %w(image/jpeg image/jpg image/png)
  letsrate_rater
  acts_as_commontator

end
