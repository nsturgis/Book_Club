require 'rails_helper'

feature 'User visits index page with list of books' do
  scenario 'user visits books index page successfully' do
    @books = FactoryGirl.create_list(:book, 5)
    visit books_path

    @books.each do |book|
      expect(page).to have_content(book.title)
    end
  end
end
