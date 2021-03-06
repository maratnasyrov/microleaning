module V1
  class SciencesController < ApplicationController
    expose(:sciences) { Science.all }
    expose :science

    skip_before_action :authenticate_user!

    def index
      authenticate_user = UserPolicy.new(params[:token]).check_user

      if authenticate_user
        respond_with json: sciences
      else
        respond_with json: {  error: "Not authorized", status: 401 }
      end
    end

    def show
      authenticate_user = UserPolicy.new(params[:token]).check_user

      if authenticate_user
        science = Science.find_by(id: params[:id])

        if !science.nil?
          respond_with json: science
        else
          respond_with json: {  error: "Not found", status: 404 }
        end
      else
        respond_with json: {  error: "Not authorized", status: 401 }
      end
    end
  end
end