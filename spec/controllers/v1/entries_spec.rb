require 'rails_helper'

class Hash
  def json(parts)
    ary = parts.split(">")
    ary.reduce(self) do |memo, key|
      memo.fetch(key.to_s.strip) if memo
    end
  end
end

describe V1::EntriesController, type: :controller do

  it 'request index and return 200 OK' do
    get :index
    expect(response).to have_http_status(:ok)
  end

  it 'GET v1/entries/:id' do
    geocode = Geocode.create(lat: -10.9112370014188, long: -37.0620775222768, entry_id: 1)
    entry = Entry.create!(
              name: "test name",
              address: "test address",
              city: "test city",
              phone: "11912345678",
              score: nil
            )
    get :show, params: { id: entry.id }
    response_body = JSON.parse(response.body)

    expect(response_body.json('data > id')).to eq(entry.id.to_s)
    expect(response_body.json('data > type')).to eq('entries')
    expect(response_body.json('data > attributes > name')).to eq(entry.name)
  end

end