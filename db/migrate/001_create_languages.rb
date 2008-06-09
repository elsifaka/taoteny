class CreateLanguages < ActiveRecord::Migration
  def self.up
    create_table :languages do |t|
      t.string :name
      t.string :code_ISO_639_1
      t.string :code_ISO_639_2
      t.string :code_ISO_639_3
      t.string :code_RFC_3066

      t.timestamps
    end
  end

  def self.down
    drop_table :languages
  end
end
