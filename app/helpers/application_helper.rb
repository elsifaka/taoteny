# Methods added to this helper will be available to all templates in the application.
require 'digest/md5'
module ApplicationHelper
  def language_select(user, usage)
    render :partial => "languages/collection_select", :locals => { :object => user, :usage => usage }
  end

  def gravatar_url_for(email, options = {})    
    url_for({ :gravatar_id => Digest::MD5.hexdigest(email), :host => 'www.gravatar.com',
        :protocol => 'http://', :only_path => false, :controller => 'avatar.php'    
      }.merge(options))  
  end
end
