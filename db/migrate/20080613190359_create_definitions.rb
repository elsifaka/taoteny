class CreateDefinitions < ActiveRecord::Migration
  def self.up
    create_table :definitions do |t|
      t.references :parent
      t.references :language
      t.references :domain
      t.text :content
      t.integer :order

      t.timestamps
    end
  end

  def self.down
    drop_table :definitions
  end
end
