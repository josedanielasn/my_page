class CreateQuoteTags < ActiveRecord::Migration[6.0]
  def change
    create_table :quote_tags do |t|

      t.timestamps
    end
  end
end
