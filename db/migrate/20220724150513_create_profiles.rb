class CreateProfiles < ActiveRecord::Migration[6.1]
  def change
    create_table :profiles do |t|

      t.string :name, length: { minimum: 2, maximum: 20 }, uniqueness: true, presence: true
      t.string :introduction, length: { minimum: 2, maximum: 200 }, uniqueness: true, presence: true
      t.references :user, null: false
      t.timestamps
    end
  end
end
