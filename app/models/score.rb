# == Schema Information
#
# Table name: scores
#
#  id                     :integer          not null, primary key
#  size                   :integer
#  adaptation_for_seniors :integer
#  medical_equipment      :integer
#  medicine               :integer
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

class Score < ApplicationRecord
end
