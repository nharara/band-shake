class OfferingsController < ApplicationController
  def index
    @offerings = Offering.all
    @offering = Offering.new
  end

  def show
    @offerings = Offering.all
    @offering = Offering.find(params[:id])
  end

  def new
    @offering = Offering.new
  end


  private

  def offering_params
    params.require(:offering).permit(:price, :initial_date, :final_date)
  end
end
