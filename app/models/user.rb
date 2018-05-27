# == Schema Information
#
# Table name: users
#
#  id              :bigint(8)        not null, primary key
#  email           :string
#  password_digest :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ApplicationRecord
  has_secure_password
  has_one :token

  validates :email, presence: true, uniqueness: true

  before_create :generate_token

  def attributes_with_token
    attributes.merge(
      token: self.token.attributes
    )
  end

  private

  def generate_token
    self.token = Token.generate
  end
end
