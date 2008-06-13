class AddLangPrefToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :ui_lang, :string, :limit => 7
    add_column :users, :src_lang, :integer
    add_column :users, :tgt_lang, :integer
  end

  def self.down
    remove_column :users, :tgt_lang
    remove_column :users, :src_lang
    remove_column :users, :ui_lang
  end
end
