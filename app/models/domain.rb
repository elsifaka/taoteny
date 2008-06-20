class Domain < ActiveRecord::Base
  belongs_to :language
  validates_uniqueness_of :concept_hash, :scope => :language
  has_many :attributions
  has_many :definitions, :through => :attributions
  has_many :entries, :through => :attributions
  before_create create_concept_hash
  
  private
  def compute_concept_hash
    self.concept_hash = name.crypt("taoteny") unless params[:concept_hash].defined?
  end
end
