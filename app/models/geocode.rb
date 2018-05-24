# == Schema Information
#
# Table name: geocodes
#
#  id         :integer          not null, primary key
#  lat        :decimal(, )
#  long       :decimal(, )
#  entry_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Geocode < ApplicationRecord
  #Entry associations
  belongs_to :entry
end
