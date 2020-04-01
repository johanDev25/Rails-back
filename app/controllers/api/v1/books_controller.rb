class Api::V1::BooksController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    if params[:start].present?
      start_date = params[:start]
      end_date = params[:end]
      range = (start_date..end_date)
      books = Book.where(date: range)
    else
     books = Book.all
    end
     render json: books, status: 201
  end

  def create
		book = Book.create(books_params)

		if book.save
			render json: book, status: 201
		else
			render json: { errors: book.errors }, status: 422
		end
	end

  def destroy
    book = Book.find(params[:id])
    book.destroy

    head 204
  end

  private
  def books_params
   params.require(:book).permit(:name, :cel, :id_user, :email, :film, :film_id)
  end
end
