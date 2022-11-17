class AddCordinatesToSpells < ActiveRecord::Migration[7.0]
  def change
    add_column :spells, :latitude, :float
    add_column :spells, :longitude, :float
  end
end
