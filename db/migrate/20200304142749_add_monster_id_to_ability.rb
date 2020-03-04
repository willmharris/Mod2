class AddMonsterIdToAbility < ActiveRecord::Migration[6.0]
  def change
    add_column :abilities, :monster_id, :integer
  end
end
