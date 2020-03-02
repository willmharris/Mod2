class AddPasswordDigestToDm < ActiveRecord::Migration[6.0]
  def change
    add_column :dms, :password_digest, :string
  end
end
