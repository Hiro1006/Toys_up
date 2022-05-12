class CreateToys < ActiveRecord::Migration[6.1]
  def change
    create_table :toys do |t|
      t.integer :genre_id
      t.integer :end_user_id
      t.text :caption
      t.timestamps
    end
  end
end
