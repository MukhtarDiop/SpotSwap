class SpotsController < ApplicationController
  
  def index
    @spots = Spot.all
  end
  def show
  end
end
