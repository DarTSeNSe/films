class FilmsController < ApplicationController

  def index
    @films = Film.all
  end

  def create
    Film.add_film(params[:link])
    render :index
  end
end
