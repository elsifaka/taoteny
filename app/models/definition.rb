class Definition < ActiveRecord::Base
  belongs_to :language
  belongs_to :entry
  acts_as_tree
end
