class AddTwitterToUsuarios < ActiveRecord::Migration
  def change
    add_column :usuarios, :twitter_token, :string

    add_column :usuarios, :twitter_verifier, :string

  end
end
