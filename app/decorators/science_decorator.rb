class ScienceDecorator < ApplicationDecorator
  delegate_all

  def test_number
    return "Кол-во тестов: #{object.tests.all.length}"
  end
end
