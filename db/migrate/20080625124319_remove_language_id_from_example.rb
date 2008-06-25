class RemoveLanguageIdFromExample < ActiveRecord::Migration
  def self.up
    remove_column :examples, :language_id
  end

  def self.down
    add_column :examples, :language_id, :integer
  end
end
