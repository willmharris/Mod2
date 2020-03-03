class AddStatsToMonster < ActiveRecord::Migration[6.0]
  def change
    add_column :monsters, :creator_id, :integer
    add_column :monsters, :size, :string
    add_column :monsters, :category, :string
    add_column :monsters, :alignment, :string
    add_column :monsters, :ac, :integer
    add_column :monsters, :hp, :integer
    add_column :monsters, :speed, :integer
    add_column :monsters, :strength, :integer
    add_column :monsters, :dexterity, :integer
    add_column :monsters, :constitution, :integer
    add_column :monsters, :intelligence, :integer
    add_column :monsters, :wisdom, :integer
    add_column :monsters, :charisma, :integer
    add_column :monsters, :cr, :integer
  end
end
