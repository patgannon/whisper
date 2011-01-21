class BusinessesController < ApplicationController
  def rate
    @business = Business.find(params[:id])
    @rating = @business.ratings.detect do |rating| 
      rating.user_id == current_user_id
    end

    if params[:rating]
      if @rating
        @rating.rating = params[:rating].to_i
        @rating.comment = params[:comment]
        @rating.user_id = current_user_id
      else
        @rating = Rating.new(:rating => params[:rating].to_i, 
        :comment => params[:comment], :user_id => current_user_id)
        @business.ratings << @rating
      end
      @business.save!
    end

    @rating_value = @rating.rating if @rating

    render :show
  end

  def current_user_id
    "pat"
  end
end
