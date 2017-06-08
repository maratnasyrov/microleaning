module V1
  class UserAnswersController < ApplicationController
    expose :user_answer

    skip_before_action :authenticate_user!

    def create
      authenticate_user = UserPolicy.new(params[:token]).check_user

      if authenticate_user
        user_answer = UserAnswer.create(game_id: game.id, answer_id: answer.id, question_id: question.id)

        respond_with json: user_answer
      else
        respond_with json: {  error: "Not authorized", status: 401 }
      end
    end

    def destroy
      authenticate_user = UserPolicy.new(params[:token]).check_user
      
      if authenticate_user
        user_answer.destroy

        respond_with json: { accepted: "UserAnswer was successfully deleted", status: 201 }
      else
        respond_with json: {  error: "Not authorized", status: 401 }
      end
    end
  end
end