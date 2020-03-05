class AddPopularityToMonster < ActiveRecord::Migration[6.0]
  def change
    add_column :monsters, :popularity, :integer
  end
end
