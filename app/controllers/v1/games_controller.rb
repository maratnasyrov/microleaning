module V1
  class GamesController < ApplicationController
    expose(:games)
    expose(:game)

    skip_before_action :authenticate_user!

    def create
      authenticate_user = UserPolicy.new(params[:token]).check_user

      if authenticate_user
        test_find = Test.find_by id: params[:test_id]
        answers_number = params[:answer_number].to_i

        if test_find
          game = Game.create(answers_number: answers_number, user_id: authenticate_user.id, test_id: test_find.id) 
          game.save

          respond_with json: game
        else
          respond_with json: { error: "Test not found", status: 404 }
        end
      else
        respond_with json: {  error: "Not authorized", status: 401 }
      end
    end

    def update
      authenticate_user = UserPolicy.new(params[:token]).check_user

      if authenticate_user
        game.update_attributes(games_params)

        respond_with json: game 
      else
        respond_with json: {  error: "Not authorized", status: 401 }
      end
    end

    private 

    def games_params
      params.require(:game).permit(:answers_number, :comleted).merge(user_id: user.id, test_id: test.id)
    end
  end
end