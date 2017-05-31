module V1
  class SciencesController < ApplicationController    
    expose(:sciences) { Science.all }
    expose :science

    def index
      respond_with json: sciences
    end

    def show
      science = Science.find_by(id: params[:id])

      if !science.nil?
        respond_with json: science
      else
        respond_with json: {  error: "Not found", status: 401 }
      end
    end
  end
end