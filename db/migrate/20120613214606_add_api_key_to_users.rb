class AddApiKeyToUsers < ActiveRecord::Migration
  def change
    add_column :usuarios, :api_key, :string, unique: true
    add_index :usuarios, :api_key, unique: true
  end

end
