class ReviewsController < ApplicationController

  def create
    @book = Book.find(params[:book_id])
    @review = @book.reviews.build(review_params)
      if @review.save
        redirect_to book_path(@book), notice: "Review Successfully Created"
      else
        redirect_to book_path(@book), notice: "Error"
      end
  end

private

  def review_params
    params.require(:review).permit(:rating, :body)
  end

end
