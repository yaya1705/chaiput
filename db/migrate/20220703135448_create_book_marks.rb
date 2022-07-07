class CreateBookMarks < ActiveRecord::Migration[6.1]
  def change
    create_table :book_marks do |t|
      t.integer :user_id
      t.integer :example_sentence_id
      t.timestamps
    end
  end
end
