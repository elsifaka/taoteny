class DomainMeta < ActiveRecord::Base
  belongs_to :language
  belongs_to :domain
end
