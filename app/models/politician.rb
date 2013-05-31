require_relative '../../db/config'

class Politician < ActiveRecord::Base
  validates_uniqueness_of :email
  validates_format_of :phone, :with => /^[()0-9\-\+\s]+/

end