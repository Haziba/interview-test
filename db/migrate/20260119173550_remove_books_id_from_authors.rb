class RemoveBooksIdFromAuthors < ActiveRecord::Migration[8.1]
  def change
    remove_foreign_key :authors, :books
    remove_column :authors, :books_id, :integer
  end
end
