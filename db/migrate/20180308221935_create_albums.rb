class CreateAlbums < ActiveRecord::Migration[5.1]
  def change
    create_table :albums do |t|
      t.string :title, presence: true
      t.integer :band_id, presence: true
      t.integer :year, presence: true
      t.string :recording_type, presence: true

      t.timestamps
    end
    add_index :albums, %i(title band_id), unique: true
    add_foreign_key :albums, :bands
  end
end
