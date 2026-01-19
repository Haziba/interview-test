class AddAuthorReferenceToBooks < ActiveRecord::Migration[8.1]
  def change
    remove_column :books, :author
    add_reference :books, :author, foreign_key: true
  end
end
