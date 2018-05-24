class EntrySerializer < ActiveModel::Serializer
  #Score associations
  belongs_to :score

  #Geocode associations
  has_one :geocode

  # Link HATEOAS
  link(:self) { entry_url(object.id) }

  def entries_count
    Entry.all.count
  end

  attributes :id, :name, :address, :city, :phone, :score_id, :entries_count
end
