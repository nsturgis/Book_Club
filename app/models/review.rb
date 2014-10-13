class Review < ActiveRecord::Base
  belongs_to :book

  validates :rating, presence: true, inclusion: { within: 1..5 }
  validates :body, presence: true
end

