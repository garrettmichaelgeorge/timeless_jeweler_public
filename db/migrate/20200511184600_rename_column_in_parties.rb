class RenameColumnInParties < ActiveRecord::Migration[6.0]
  def change
    rename_column :parties, :type, :party_type
    #Ex:- rename_column("admin_users", "pasword","hashed_pasword")
  end
end
