class AddUsernameAndNameToHacker < ActiveRecord::Migration
  def change
    add_column :hackers, :username, :string
    add_column :hackers, :name, :string
  end
end
