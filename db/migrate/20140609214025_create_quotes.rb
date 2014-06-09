class CreateQuotes < ActiveRecord::Migration
  def change
    create_table :quotes do |t|
      t.text :excerpt
      t.belongs_to :band
      t.belongs_to :song

      t.timestamps
    end
  end
end
