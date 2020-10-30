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

    # MongoidClip.includes(:raga).all.each do |clip|
    #   attributes = clip.attributes.slice(
    #     "title",
    #     "url",
    #     "embed_code",
    #     "thumbnail_url",
    #     "created_at",
    #     "upated_at",
    #   ).merge(
    #     "raga_id" => Raga.find_by(slug: clip.raga.url).id,
    #   )
    #   Clip.create!(attributes)
    # end
  end
end
