class CreateExampleSentences < ActiveRecord::Migration[6.1]
  def change
    create_table :example_sentences do |t|

      t.string :sentences, null: false
      t.integer :word_id
      t.integer :user_id

      t.timestamps
    end
  end
end
