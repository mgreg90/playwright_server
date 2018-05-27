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

class Token < ApplicationRecord
  belongs_to :user
  validates :value, presence: true
  validates :expiration, presence: true

  def self.generate
    new(
      value: SecureRandom.uuid,
      expiration: Date.today + 30.days
    )
  end

  def expired?
    Date.today > expiration
  end
end
