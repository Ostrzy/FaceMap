class DeviseCreateUsers < ActiveRecord::Migration
  def self.up
    create_table(:users) do |t|
      t.string :uid
      t.string :provider
      t.string :name
      t.string :location
      t.string :picture

      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
