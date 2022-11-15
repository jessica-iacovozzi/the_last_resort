class AddUserReferenceToSpells < ActiveRecord::Migration[7.0]
  def change
    add_reference :spells, :user, null: false, foreign_key: true
  end
end
