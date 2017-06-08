module V1
  class TestsController < ApplicationController
    expose :science
    expose(:tests) { science.tests.all }
    expose :test

    skip_before_action :authenticate_user!

    def index
      authenticate_user = UserPolicy.new(params[:token]).check_user

      if authenticate_user
        respond_with json: tests
      else
        respond_with json: {  error: "Not authorized", status: 401 }
      end
    end

    def show
      authenticate_user = UserPolicy.new(params[:token]).check_user
      
      if authenticate_user
        test = Test.find_by(id: params[:id])

        if !test.nil?
          respond_with json: test
        else
          respond_with json: {  error: "Not found", status: 404 }
        end
      else
        respond_with json: {  error: "Not authorized", status: 401 }
      end
    end
  end
end