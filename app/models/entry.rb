class Entry < ActiveRecord::Base
  belongs_to :language
  has_many :attributions, :dependent => :destroy
  has_many :definitions, :through => :attributions
  has_many :part_of_speeches, :through => :attributions
  has_many :examples, :through => :attributions
end
