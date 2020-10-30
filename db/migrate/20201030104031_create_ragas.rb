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

    MongoidRaga.all.each do |raga|
      attributes = raga.attributes.slice(
        "title",
        "ascending_scale",
        "chakra",
        "clips_count",
        "descending_scale",
        "description",
        "drone",
        "pakad",
        "samvaadi",
        "spotify_playlist_url",
        "thaat",
        "time",
        "vaadi",
        "created_at",
        "updated_at",
      ).merge("slug" => raga.url)

      Raga.create!(attributes)
    end
  end
end
