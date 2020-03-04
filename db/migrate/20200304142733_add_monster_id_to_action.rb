class AddMonsterIdToAction < ActiveRecord::Migration[6.0]
  def change
    add_column :actions, :monster_id, :integer
  end
end
