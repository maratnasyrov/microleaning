class QuestionsController < ApplicationController
  expose(:test)
  expose(:questions) { test.questions.all}
  expose(:question)

  def create
    question = Question.create(questions_params)
    success = question.save

    if success
      render_questions
    else
      respond_with test, notice: "Ошибка!"
    end
  end

  def destroy
    success = question.destroy

    if success
      render "questions/_questions", questions: questions, layout: false
    else
      respond_with test, notice: "Ошибка!"
    end
  end

  private

  def render_questions
    respond_to do |format|
      format.html
      format.js { render 'questions/_questions' }
    end
  end

  def questions_params
    params.require(:question).permit(:name).merge(test_id: test.id)
  end
end
