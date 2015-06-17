class Person < ActiveRecord::Base
  has_one :users
  mount_uploader :avatar, AvatarUploader  
end
