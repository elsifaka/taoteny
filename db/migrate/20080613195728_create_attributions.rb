class CreateAttributions < ActiveRecord::Migration
  def self.up
    create_table :attributions do |t|
      t.references :part_of_speech
      t.references :definition
      t.references :entry
      t.integer :order

      t.timestamps
    end
  end

  def self.down
    drop_table :attributions
  end
end
