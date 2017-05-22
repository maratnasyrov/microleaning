class TestsController < ApplicationController
  expose(:tests) { Test.all }
  expose(:test, attributes: :tests_params)
  expose(:science)
  expose(:question) { Question.new }
  expose(:questions) { test.questions.all }

  def create
    test = Test.create(tests_params)

    respond_with science, test, notice: "Тест создан"
  end

  def edit
    test.update_attributes(tests_params)

    respond_with test
  end

  def destroy
    test.destroy

    respond_with tests
  end

  private

  def tests_params
    params.require(:test).permit(:name).merge(user_id: current_user.id, science_id: science.id)
  end
end
