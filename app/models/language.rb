class Language < ActiveRecord::Base
  validates_presence_of :name
  validates_uniqueness_of :name, :code_ISO_639_3
  
  has_many :domain_metas
  has_many :domains, :through => :domain_metas
  has_many :entries
    
  def public_name
    name.titleize
  end
  
  def validates_format_of(content)
    /\b(?:(?:(?:ai|ae|ao|a|à|ei|eo|e|ia|iai|ie|io|i|oai|oa|oe|oi|o|ò|-)?(?:(?:b|dr|d|f|g|h|j|k|l|mb|mp|m|ndr|ntr|nts|nd|nj|ng|nk|nt|n|p|r|s|tr|ts|t|v|z)(?:'?(?:ai|ae|ao|a|à|ei|eo|e|ia|iai|ie|io|i|oai|oa|oe|oi|o|ò)|-))*(?:b|dr|d|f|g|h|j|k|l|mb|mp|m|ndr|ntr|nts|nd|nj|ng|nk|nt|(?:\w+)n'n|n|p|r|s|tr|ts|t|v|z)(?:ao|ae|a-|a|à|eo|e|i-|ia|ie|io|oay|oa|oe|o-|o|ò|oy|iay|ey|ay|y))|ah|an|ar|eh|e|i|oh|ô|ao|eo|e|ia|ie|io)\b/
  end
  
end
