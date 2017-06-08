module V1
  class QuestionsController < ApplicationController
    expose(:test)
    expose(:questions) { test.questions.all }
    expose :question

    skip_before_action :authenticate_user!

    def index
      respond_with json: JSON.parse(questions.to_json(
          :include => {
          :answers => { 
            :only => [ :id, :name, :correct, :question_id ]
          }},
        :only => [ :id, :name, :test_id ]
      ))
    end

    def show
      json_out = question.decorate.question_and_answers_json
      
      respond_with json: json_out
    end
  end
end