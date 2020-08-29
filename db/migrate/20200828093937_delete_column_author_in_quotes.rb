class DeleteColumnAuthorInQuotes < ActiveRecord::Migration[6.0]
  def change
    remove_column :quotes, :author
  end
end
