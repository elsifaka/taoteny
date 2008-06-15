class CreateDefinitions < ActiveRecord::Migration
  def self.up
    create_table :definitions do |t|
      t.string :concept_hash # used to identify the same definition in many languages
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
