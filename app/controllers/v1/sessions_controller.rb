module V1
  class SessionsController < Devise::SessionsController
    def create
      user = AuthenticateUser.call(warden: warden).user
      respond_with json: user
    end
  end
end