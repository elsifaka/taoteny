class CreateDomains < ActiveRecord::Migration
  def self.up
    create_table :domains do |t|
      t.string :concept_hash # used to identify the same domain in many languages
      t.string :name
      t.string :description
      t.references :language

      t.timestamps
    end
  end

  def self.down
    drop_table :domains
  end
end
