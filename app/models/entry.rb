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
