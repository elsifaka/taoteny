class Entry < ActiveRecord::Base
  belongs_to :language
  has_many :definitions
end
