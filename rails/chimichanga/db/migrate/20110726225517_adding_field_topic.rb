class AddingFieldTopic < ActiveRecord::Migration
  def self.up
    add_column :parties, :topic, :string
  end

  def self.down
    remove_column :parties, :topic
  end
end
