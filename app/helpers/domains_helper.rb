module DomainsHelper
  def domain_name(domain)
    my_domain_meta = domain.domain_metas.detect {|d| d.language_id == cookies[:interface_language_code_ISO_639_3]}
    my_domain_meta.name
  end
end
