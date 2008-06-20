class CreateDomainMetas < ActiveRecord::Migration
  def self.up
    create_table :domain_metas do |t|
      t.references :domain
      t.string :name
      t.string :description
      t.references :language

      t.timestamps
    end
  end

  def self.down
    drop_table :domain_metas
  end
end
