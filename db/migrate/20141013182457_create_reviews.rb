class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :book_id, null:false
      t.integer :rating, null: false
      t.text :body, null:false

      t.timestamps
    end
  end
end
