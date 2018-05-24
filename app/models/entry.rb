# == Schema Information
#
# Table name: entries
#
#  id         :integer          not null, primary key
#  name       :string
#  address    :string
#  city       :string
#  phone      :string
#  score_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Entry < ApplicationRecord
  #Score associations
  belongs_to :score

  #Geocode associations
  has_one :geocode
  accepts_nested_attributes_for :geocode, update_only: true

  def entries_count
  	Entry.all.count
  end
end
