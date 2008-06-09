class CreateEntries < ActiveRecord::Migration
  def self.up
    create_table :entries do |t|
      t.references :language
      t.string :value

      t.timestamps
    end
  end

  def self.down
    drop_table :entries
  end
end
