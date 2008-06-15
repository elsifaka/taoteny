class Domain < ActiveRecord::Base  
  acts_as_tree
  belongs_to :language
  has_many :definitions
  has_many :attributions, :through => :definitions
  has_many :entries, :through => :attributions
end
