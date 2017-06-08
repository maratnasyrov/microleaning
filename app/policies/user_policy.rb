class UserPolicy
  attr_reader :token

  def initialize(token)
    @token = token
  end

  def check_user
    user = User.find_by authentication_token: token

    return user
  end
end
