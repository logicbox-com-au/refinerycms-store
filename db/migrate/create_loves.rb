class CreateLoves < ActiveRecord::Migration
  def self.up
    create_table :loves do |t|
      t.integer :member_id
      t.integer :loveable_id
      t.string :loveable_type

      t.timestamps
    end
  end

  def self.down
    drop_table :loves
  end
end
