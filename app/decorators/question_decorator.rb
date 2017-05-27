class QuestionDecorator < ApplicationDecorator
  delegate_all

  def question_and_answers_json
    json_out = JSON.parse(object.to_json(
      :include => { 
        :answers => { 
          :only => [ :id, :name, :correct, :question_id ]
        }},
      :only => [ :id, :name, :test_id ]
    ))

    return json_out
  end
end