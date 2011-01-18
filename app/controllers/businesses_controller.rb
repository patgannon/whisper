class BusinessesController < ApplicationController
  def rate
    business = Business.find(params[:id])
    business.ratings << Rating.new(:rating => params[:rating], :comment => params[:comment])
    business.save

    render :show
  end
end
