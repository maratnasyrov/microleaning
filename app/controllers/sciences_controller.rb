class SciencesController < ApplicationController
  expose(:sciences) { Science.all }
  expose :science, attributes: :sciences_params
  expose(:tests) { science.tests.all }

  def create
    science = Science.create(sciences_params)

    respond_with science
  end

  def edit
    science.update_attributes(sciences_params)

    respond_with science
  end

  def destroy
    science.destroy

    redirect_to sciences_path
  end

  private

  def sciences_params
    params.require(:science).permit(:name).merge(user_id: current_user.id)
  end
end
