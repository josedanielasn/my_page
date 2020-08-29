class AddForeignKey < ActiveRecord::Migration[6.0]
  def change
    def change
      add_reference :quotes, :author, foreign_key: true
      add_foreign_key :quotes, :authors
    end
  end
end
