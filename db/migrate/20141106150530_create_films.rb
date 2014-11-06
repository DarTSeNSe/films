class CreateFilms < ActiveRecord::Migration
  def change
    create_table :films do |t|
      t.string :name
      t.string :original_name
      t.string :year
      t.string :genre
      t.string :released
      t.string :director
      t.string :cast
      t.string :description
      t.string :quality
      t.string :video
      t.string :audio
      t.string :size
      t.string :duration
      t.string :translation
      t.string :subtitles
      t.string :link

      t.timestamps
    end
  end
end
