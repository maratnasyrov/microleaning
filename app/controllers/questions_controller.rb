class QuestionsController < ApplicationController
  expose(:test)
  expose(:questions) { test.questions.all}
  expose(:question)
  expose(:answer) { Answer.new }
  expose(:science)

  def create
    question = Question.create(questions_params)
    success = question.save

    science_flag = Science.find_by(id: test.science_id)

    if success
      respond_with science_flag, test
    else
      respond_with test, notice: "Ошибка!"
    end
  end

  def destroy
    science_flag = Science.find_by(id: test.science_id)

    success = question.destroy

    if success
      respond_with science_flag, test
    else
      respond_with test, notice: "Ошибка!"
    end
  end

  private

  def questions_params
    params.require(:question).permit(:name).merge(test_id: test.id)
  end
end
