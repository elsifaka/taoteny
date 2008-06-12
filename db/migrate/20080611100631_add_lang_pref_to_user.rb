class AddLangPrefToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :ui_lang, :string, :limit => 5
    add_column :users, :src_lang, :string, :limit => 5
    add_column :users, :tgt_lang, :string, :limit => 5
  end

  def self.down
    remove_column :users, :tgt_lang
    remove_column :users, :src_lang
    remove_column :users, :ui_lang
  end
end
