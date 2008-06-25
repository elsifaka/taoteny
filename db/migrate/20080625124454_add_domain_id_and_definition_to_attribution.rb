class AddDomainIdAndDefinitionToAttribution < ActiveRecord::Migration
  def self.up
    add_column :attributions, :domain, :integer
    add_column :attributions, :definition, :text
    add_column :attributions, :source_url, :string
  end

  def self.down
    remove_column :attributions, :source_url
    remove_column :attributions, :definition
    remove_column :attributions, :domain
  end
end
