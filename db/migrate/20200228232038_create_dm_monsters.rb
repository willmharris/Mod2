class CreateDmMonsters < ActiveRecord::Migration[6.0]
  def change
    create_table :dm_monsters do |t|
      t.integer :dm_id
      t.integer :monster_id

      t.timestamps
    end
  end
end
