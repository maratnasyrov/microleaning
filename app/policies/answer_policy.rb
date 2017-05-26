class AnswerPolicy
  attr_reader :answer

  def initialize(answer)
    @answer = answer.to_model
  end

  def set_status_class
    if answer.correct == true
      return "success"
    else
      return "secondary"
    end
  end
end
