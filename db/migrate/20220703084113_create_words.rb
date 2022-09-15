class CreateWords < ActiveRecord::Migration[6.1]
  def change
    create_table :words do |t|

      t.string :cn_word, null: false
      t.string :jp_word, null: false
      t.string :pinyin, null: true
      t.integer :user_id
      t.integer :genre_id

      t.timestamps
    end
  end
end
