class PartOfSpeech < ActiveRecord::Base
  belongs_to :language
  has_many :attributions
end
