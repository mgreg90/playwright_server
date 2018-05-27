class AuthenticateUser
  prepend SimpleCommand
  
  def call
    user
  end

  def initialize token:
    errors.add(:token, "No token provided!") unless token
    @token_value = token
  end
  
  private
  
  attr_reader :token_value
  
  def token
    return @token if defined?(@token)
    @token = Token.find_by(value: token_value)
    unless @token
      errors.add(:token, "Token not found!")
      return
    end
    errors.add(:token, "Token expired!") if @token.expired?
    @token
  end
  
  def user
    @user ||= token.try(:user)
  end
end