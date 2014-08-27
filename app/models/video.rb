class Video < ActiveRecord::Base
	belongs_to :user
	mount_uploader :url, UrlUploader
	attr_accessor :delete_check
end
