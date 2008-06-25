class Attribution < ActiveRecord::Base
  belongs_to :entry
  has_one :definition
  has_many :examples
  belongs_to :part_of_speech
  
  def definition=(definition)
    self.definition.new(:content => definition)
  end

  def example=(example)
    self.examples << Example.new(:content => example)
  end
  
  def example
    false
  end
end
