class CreateEntries < ActiveRecord::Migration[6.1]
  def change
    create_table :entries do |t|
      t.integer :end_user_id
      t.integer :room_id

      t.timestamps
    end
  end
end
