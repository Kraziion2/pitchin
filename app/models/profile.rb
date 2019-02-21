class Profile < ApplicationRecord
  belongs_to :user 
  validates :name ,:surname ,:education ,:experience ,:knowledge ,:availability ,:address ,presence:true
end
