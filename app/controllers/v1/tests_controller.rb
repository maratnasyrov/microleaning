module V1
  class TestsController < ApplicationController
    expose :science
    expose(:tests) { science.tests.all }
    expose :test

    def index
      respond_with json: tests
    end

    def show
      test = Test.find_by(id: params[:id])

      if !test.nil?
        respond_with json: test
      else
        respond_with json: {  error: "Not found", status: 404 }
      end
    end
  end
end