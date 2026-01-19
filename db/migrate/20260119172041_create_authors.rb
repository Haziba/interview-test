class CreateAuthors < ActiveRecord::Migration[8.1]
  def change
    create_table :authors do |t|
      t.string :name
      t.references :books, null: false, foreign_key: true

      t.timestamps
    end
  end
end
