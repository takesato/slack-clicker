class InitialSchema < ActiveRecord::Migration
  def self.up
    create_table :channels do |t|
      t.string :channel_id
      t.string :name
      t.string :count
    end
  end

  def self.down
    drop_table :channels
  end
end
