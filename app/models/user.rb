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