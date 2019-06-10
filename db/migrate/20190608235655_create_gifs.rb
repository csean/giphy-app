class CreateGifs < ActiveRecord::Migration[5.2]
  def change
    create_table :gifs do |t|
      t.string :giphy_id, null: false
      t.integer :users_count
      t.timestamps
      t.index :giphy_id, unique: true
    end

    create_table :favorites do |t|
      t.references :user, index: true
      t.references :gif, index: true
      t.datetime :created_at
    end
  end
end
