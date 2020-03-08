class CreateQuotes < ActiveRecord::Migration[4.2]
  def change
    create_table :quotes do |t|
      t.text :excerpt
      t.belongs_to :band
      t.belongs_to :song

      t.timestamps
    end
  end
end
