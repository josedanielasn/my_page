class Quotes < ActiveRecord::Migration[6.0]
  def change
    create_table :quotes do |t|
      t.text :quote
    end
  end
end
