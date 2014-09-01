class Video < ActiveRecord::Base
	belongs_to :user
	mount_uploader :url, UrlUploader
	attr_accessor :delete_check

  	validates :name, presence: :true
  	validates :start_date, :presence => {:message => 'は必須です。'}
  	validates :url, :presence => {:message => 'は必須です。'}
end
