class Author < ActiveRecord::Migration[6.0]
  def change
    add_column :quotes, :author, :string
  end
end
