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

require 'rails_helper'

RSpec.describe Geocode, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
