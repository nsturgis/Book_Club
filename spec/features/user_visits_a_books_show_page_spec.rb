require 'rails_helper'

feature 'User clicks on link to a books show page' do
  scenario 'User views books show page successfully' do
    @book = FactoryGirl.create(:book)
    @reviews = FactoryGirl.create_list(:review, 5, book: @book)
    visit book_path(@book)

    expect(page).to have_content @book.title
    expect(page).to have_content @book.author
    expect(page).to have_content @book.year_published
    expect(page).to have_content @book.description
    expect(page).to have_content @book.category

    @reviews.each do |review|
      expect(page).to have_content review.rating
      expect(page).to have_content review.body
    end
  end
end
