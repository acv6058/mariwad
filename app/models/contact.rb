class Contact < ActiveRecord::Base
  validates_presence_of :company_name, :address, :phone1, :email
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  validates_length_of :phone1, :minimum => 7
  validates_length_of :fax, :minimum => 7, :allow_blank => true

  geocoded_by :address
  after_validation :geocode
end
