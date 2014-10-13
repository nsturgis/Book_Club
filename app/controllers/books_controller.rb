class BooksController < ApplicationController

  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
    @reviews = Review.new
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
      if @book.save
        redirect_to book_path(@book), notice: "Book Successfully Created"
      else
        render 'books/new', notice: "Error"
      end
  end

private

  def book_params
    params.require(:book).permit(:title, :author, :year_published, :description, :category)
  end

end
