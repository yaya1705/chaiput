class CreateWordTags < ActiveRecord::Migration[6.1]
  def change
    create_table :word_tags do |t|
      t.references :word, null: false, foreign_key: true
      t.references :tag, null: false, foreign_key: true

      t.timestamps
      # 同じタグを２回保存するのは出来ないようになる
      # add_index :word_tags, [:word_id, :tag_id], unique: true
    end
  end
end
