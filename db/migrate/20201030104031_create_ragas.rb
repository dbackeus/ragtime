class CreateRagas < ActiveRecord::Migration
  def change
    create_table :ragas do |t|
      t.string :title, null: false
      t.string :ascending_scale, null: false
      t.string :chakra
      t.integer :clips_count, null: false, default: 0
      t.string :descending_scale, null: false
      t.string :description
      t.string :drone
      t.string :pakad
      t.string :samvaadi
      t.string :slug, null: false
      t.string :spotify_playlist_url
      t.string :thaat
      t.string :time
      t.string :vaadi

      t.timestamps null: false
    end

    add_index :ragas, :title, unique: true
    add_index :ragas, :slug, unique: true
  end
end
