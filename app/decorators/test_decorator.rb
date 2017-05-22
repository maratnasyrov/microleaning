class TestDecorator < ApplicationDecorator
  delegate_all

  def questions_number
    return "Кол-во вопросов: #{object.questions.all.length}"
  end
end
