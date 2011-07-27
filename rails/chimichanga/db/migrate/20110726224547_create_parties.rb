class CreateParties < ActiveRecord::Migration
  def self.up
    create_table :parties do |t|
      t.text :address
      t.integer :capacity
      t.boolean :byod
      t.float :price

      t.timestamps
    end
  end

  def self.down
    drop_table :parties
  end
end
