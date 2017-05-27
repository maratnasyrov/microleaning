class QuestionPolicy
  attr_reader :question

  def initialize(question)
    @question = question.to_model
  end

  def check_answers?
    if question.answers.all.length < 4
      return true
    elsif question.answers.all.length >= 4
      return false
    end
  end

  def check_correct_answer?
    flag = false
    if question.answers.all.length == 4
      question.answers.all.each do |answer|
        if answer.correct == true
          flag = true

          break
        end
      end
    else
      flag = true
    end

    return flag
  end
end
