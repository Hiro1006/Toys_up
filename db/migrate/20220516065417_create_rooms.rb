class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|

      t.integer :end_user_id
      t.timestamps
    end
  end
end
