class RemoveConceptHashFromDomain < ActiveRecord::Migration
  def self.up
    remove_column :domains, :concept_hash
  end

  def self.down
    add_column :domains, :concept_hash, :string
  end
end
