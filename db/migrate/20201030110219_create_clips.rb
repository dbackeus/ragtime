class CreateClips < ActiveRecord::Migration
  def change
    create_table :clips do |t|
      t.belongs_to :raga
      t.string :title, null: false
      t.string :url, null: false
      t.string :embed_code
      t.string :thumbnail_url

      t.timestamps null: false
    end

    add_index :clips, :raga_id
    add_foreign_key :clips, :ragas
  end
end
