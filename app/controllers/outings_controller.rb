class OutingsController < ApplicationController
  def show
    @outing = Outing.find(params[:id])
  end

  def destroy
    outing = Outing.find(params[:id])
    outing.contestants.destroy(params[:contestant])
    redirect_to outing_path(outing)
  end
end