class Domain < ActiveRecord::Base
  has_many :definitions
  has_many :attributions, :through => :definitions
  has_many :entries, :through => :attributions
  has_many :domain_metas

  def domain_metas_attributes=(attr)
    attr.each do |m|
      if m[:id].blank?
        domain_metas.build(m)
      else
        my_m = domain_metas.detect {|my_m| my_m.id = m[:id].to_i }
        my_m.attributes = m
        my_m.save
      end
    end
  end

  def meta_value(key, code)
    my_meta = domain_metas.detect(domain_metas[0]) {|my_m| my_m.language.code_ISO_639_1 == code}
    my_meta.send key
  end

  def method_missing(method, *args)
    if /^(description|name)_..$/.match method.to_s
      self.send :meta_value, method.to_s.split("_")[0], method.id2name.split("_")[1] ##
    else
      super(method, *args)
    end
  end
  
  def respond_to?(symbol, include_private = false)
    if /^(description|name)_..$/ =~ symbol.to_s
      true
    else
      super(symbol, include_private)
    end
  end
end
