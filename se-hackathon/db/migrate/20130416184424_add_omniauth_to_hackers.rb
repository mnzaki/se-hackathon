class AddOmniauthToHackers < ActiveRecord::Migration
  def change
    add_column :hackers, :provider, :string
    add_column :hackers, :uid, :string
  end
end
