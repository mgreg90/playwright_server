# == Schema Information
#
# Table name: tokens
#
#  id         :bigint(8)        not null, primary key
#  user_id    :bigint(8)
#  value      :string
#  expiration :date
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Token, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
