class CreateUserStories < ActiveRecord::Migration
  def change
    create_table :user_stories do |t|
      t.integer :number
      t.text :description

      t.timestamps
    end
  end
end
