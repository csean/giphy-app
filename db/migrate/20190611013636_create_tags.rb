class CreateTags < ActiveRecord::Migration[5.2]
  def change
    create_table :tags do |t|
      t.string :name
      t.integer :gifs_counter
      t.timestamps
    end

    create_join_table :gifs, :tags do |t|
      t.index :gif_id
      t.index :tag_id
    end
  end
end
