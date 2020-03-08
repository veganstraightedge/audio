class CreateAlbums < ActiveRecord::Migration[4.2]
  def change
    create_table :albums do |t|
      t.string :name
      t.belongs_to :band

      t.timestamps
    end
  end
end
