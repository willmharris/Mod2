class AddEmailToDm < ActiveRecord::Migration[6.0]
  def change
    add_column :dms, :email, :string
  end
end
