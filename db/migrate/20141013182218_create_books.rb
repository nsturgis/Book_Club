class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title, null: false
      t.string :author, null: false
      t.integer :year_published, null: false
      t.text :description
      t.string :category

      t.timestamps
    end
  end
end
