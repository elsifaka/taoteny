class CreatePartOfSpeeches < ActiveRecord::Migration
  def self.up
    create_table :part_of_speeches do |t|
      t.references :language
      t.string :value
      t.string :description

      t.timestamps
    end
  end

  def self.down
    drop_table :part_of_speeches
  end
end
