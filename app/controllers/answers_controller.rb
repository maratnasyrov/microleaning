class AnswersController < ApplicationController
  expose(:question)
  expose(:answers) { question.answers.all}
  expose(:answer)
  expose(:notice_msg) { "" }

  def create
    if QuestionPolicy.new(question).check_answers?
      answer = Answer.create(answers_params)
      success = answer.save

      if success
        if QuestionPolicy.new(question).check_correct_answer? == true
          render_answers("Вариант ответа добавлен", "notice")
        elsif QuestionPolicy.new(question).check_correct_answer? == false
          render_answers("Ответ добавлен, но ни один из ответов не является правильным!", "callout alert")
        end
      else
        render_answers("Ошибка!", "callout alert")
      end
    else
      render_answers("Уже создано 4 ответа!", "callout alert")
    end
  end

  def destroy
    success = answer.destroy

    if success
      render_answers("Вариант ответа удален!", "notice")
    else
      render_answers("Ошибка!", "callout alert")
    end
  end

  private

  def render_answers(notice, msg_class)
    render "answers/_answers", locals: { answers: answers, notice_msg: notice, msg_class: msg_class }
  end

  def answers_params
    params.require(:answer).permit(:name, :correct).merge(question_id: question.id)
  end
end
