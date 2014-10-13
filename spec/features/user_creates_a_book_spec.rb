require 'rails_helper'

feature 'User creates a new book.' do
  scenario 'user successfully adds a new book' do
    visit new_book_path
    book = FactoryGirl.build(:book)


    fill_in 'Title', with: book.title
    fill_in 'Author', with: book.author
    fill_in 'Year published', with: book.year_published
    fill_in 'Description', with: book.description
    fill_in 'Category', with: book.category
    click_on 'Create Book'

    expect(page).to have_content "Book Successfully Created"
    expect(page).to have_content book.title
    expect(page).to have_content book.author
    expect(page).to have_content book.year_published
    expect(page).to have_content book.description
    expect(page).to have_content book.category
  end

  scenario 'user does not fill out required information to create book' do
    visit new_book_path

    click_on 'Create Book'

    expect(page).to_not have_content "Book Successfully Created"
    expect(page).to have_content "errors"
  end
  scenario 'user does adds a book already created' do
    visit new_book_path
    book = FactoryGirl.create(:book)

    fill_in 'Title', with: book.title
    fill_in 'Author', with: book.author
    fill_in 'Year published', with: book.year_published
    fill_in 'Description', with: book.description
    fill_in 'Category', with: book.category
    click_on 'Create Book'

    expect(page).to_not have_content "Book Successfully Created"
    expect(page).to have_content "Title has already been taken"
  end
end

