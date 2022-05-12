class AddNameToToys < ActiveRecord::Migration[6.1]
  def change
    add_column :toys, :name, :string
  end
end
