
class Api::V1::FilmsController < ApplicationController
   skip_before_action :verify_authenticity_token

  def index
    if params[:start].present?
      start_date = params[:start]
      end_date = params[:end]
      range = (start_date..end_date)
       films = Film.where(date: range)
    else
     films = Film.all
    end
     render json: films, status: 201
  end

  def create
		film = Film.create( films_params)

		if film.save
			render json: film, status: 201
		else
			render json: { errors: film.errors }, status: 422
		end
	end

  def update
  film = Film.find(params[:id])
  if film.update( films_params)
    render json: film, status: 200
  else
    render json: { errors: film.errors }, status: 422
  end
end

def destroy
  film = Film.find(params[:id])
  film.destroy

  head 204
end

  private
  def films_params
   params.require(:film).permit(:title, :plot, :url, :date, :booked)
  end
end
