class CreateSnacks < ActiveRecord::Migration
  def self.up
    create_table :snacks do |t|
      t.string :name
      t.float :price
      t.integer :size
      t.text :ingredients

      t.timestamps
    end
  end

  def self.down
    drop_table :snacks
  end
end
