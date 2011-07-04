class CreateWorns < ActiveRecord::Migration
  def self.up
    create_table :worns do |t|
      t.integer :member_id
      t.integer :wornable_id
      t.string :wornable_type
      t.string :kind

      t.timestamps
    end
  end

  def self.down
    drop_table :worns
  end
end
