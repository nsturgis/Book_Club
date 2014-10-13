class Book < ActiveRecord::Base
  has_many :reviews

  validates :title, presence: true, uniqueness: { scope: :author }
  validates :author, presence: true
  validates :year_published, presence: true
end
