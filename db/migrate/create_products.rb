class CreateProducts < ActiveRecord::Migration

  def self.up
    create_table :products do |t|
      t.string :name
      t.decimal :price
      t.text :description
      t.integer :picture_id
      t.integer :brand_id
      t.integer :category_id
      t.integer :sub_category_id
      t.integer :position
      t.integer :worns_count, :default => 0
      t.integer :loves_count, :default => 0
      t.integer :comments_count, :default => 0

      t.timestamps
    end

    add_index :products, :id

    load(Rails.root.join('db', 'seeds', 'products.rb'))
  end

  def self.down
    if defined?(UserPlugin)
      UserPlugin.destroy_all({:name => "products"})
    end

    if defined?(Page)
      Page.delete_all({:link_url => "/products"})
    end

    drop_table :products
  end

end
