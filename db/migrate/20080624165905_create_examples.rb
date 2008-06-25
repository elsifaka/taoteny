class CreateExamples < ActiveRecord::Migration
  def self.up
    create_table :examples do |t|
      t.string :content
      t.references :attribution
      t.references :language

      t.timestamps
    end
  end

  def self.down
    drop_table :examples
  end
end
