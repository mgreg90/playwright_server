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
