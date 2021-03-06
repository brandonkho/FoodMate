class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_and_belongs_to_many :preferences
  has_attached_file :avatar, 
	  :url  => "/assets/users/:id/:style/:basename.:extension",
      :path => ":rails_root/public/assets/users/:id/:style/:basename.:extension",
  	:styles => {
      :thumb    => ['100x100#',  :jpg, :quality => 70],
      :preview  => ['480x480#',  :jpg, :quality => 70],
      :large    => ['600>',      :jpg, :quality => 70],
      :retina   => ['1200>',     :jpg, :quality => 30]
    },
    :default_style => :large,
    :default_url => ActionController::Base.helpers.asset_path("howard.jpg"),
    :convert_options => {
      :thumb    => '-set colorspace sRGB -strip',
      :preview  => '-set colorspace sRGB -strip',
      :large    => '-set colorspace sRGB -strip',
      :retina   => '-set colorspace sRGB -strip -sharpen 0x0.5'
    }

  validates_attachment_content_type :avatar, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

end
