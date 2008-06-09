class DomainMeta < ActiveRecord::Base
  belongs_to :domain
  belongs_to :language
end
