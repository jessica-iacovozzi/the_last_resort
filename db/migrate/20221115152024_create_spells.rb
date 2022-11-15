class CreateSpells < ActiveRecord::Migration[7.0]
  def change
    create_table :spells do |t|
      t.string :name
      t.string :description
      t.string :category
      t.string :location
      t.string :picture_url
      t.integer :price
      t.integer :rating

      t.timestamps
    end
  end
end
