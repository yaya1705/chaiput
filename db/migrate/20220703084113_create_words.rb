class CreateWords < ActiveRecord::Migration[6.1]
  def change
    create_table :words do |t|

      t.string :cn_word, null: false
      t.string :jp_word, null: false
      t.string :supplement, null: true
      t.integer :user_id
      t.timestamps
    end
  end
end
