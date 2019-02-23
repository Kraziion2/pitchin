class Profile < ApplicationRecord
  belongs_to :user 
  validates :name ,:surname ,:education ,:experience ,:knowledge ,:availability,:country,:city ,:street,presence:true

  geocoded_by :address
  after_validation :geocode
  def address
  	[street, city, country].compact.join(', ')
  end
end
