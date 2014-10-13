require 'rails_helper'

feature 'User creates a review' do
  scenario 'User creates review successfully' do
    @book = FactoryGirl.create(:book)
    visit book_path(@book)
    @review = FactoryGirl.create(:review)

    fill_in "Rating", with: @review.rating
    fill_in "Body", with: @review.body
    click_on 'Create Review'

    expect(page).to have_content "Review Successfully Created"
  end

  scenario 'User enters invalid information' do
    @book = FactoryGirl.create(:book)
    visit book_path(@book)

    click_on 'Create Review'

    expect(page).to_not have_content "Review Successfully Created"
    expect(page).to have_content "Error"
  end
end

