# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  before_filter :detect_language, :init_content
  
  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => 'fb4c0b67c9c14c01cddef94797b674bc'
  
  private
  def init_content
    @content = {}
    @content[:baseline] = {}
    @content[:baseline][:fre] = "Encore un Mémoire de Traductions Démocratique en ligne"
    @content[:baseline][:eng] = "Yet Another Online Democratic Translation Memory"
    @content[:baseline][:mlg] = "Taoteny - Mbola Firaketana Dikanteny azo andraisana anjara amin'ny Aterineto Ihany"
    @content[:footer_info] = {}
    @content[:footer_info][:fre] = '<a href="/welcome/about" title="Encore un Mémoire de Traductions Démocratique en ligne">VM</a> a été mis sur les <a href="http://rubyonrails.com" title="Développement Web sans Souffrances">Rails</a> dans le cadre du <a href="http://telomiova.org" title="Internet - Malagasy - Mivelatra">Projet Telomiova</a> par <a href="http://jojopil.com" title="Innovations">Jojopil</a>.'
    @content[:footer_info][:eng] = '<a href="/welcome/about" title="Yet Another Online Democratic Translation Memory">VM</a> was dropped on <a href="http://rubyonrails.com" title="Web Development that doesn\'t hurt">Rails</a> for the <a href="http://telomiova.org" title="Internet - Malagasy - Mivelatra">Telomiova Project</a> by <a href="http://jojopil.com" title="Innovations">Jojopil</a>.'
    @content[:footer_info][:mlg] = '<a href="/welcome/about" title="Mbola Firaketana Dikanteny azo andraisana anjara amin\'ny Aterineto Ihany">VM</a> dia nampetrak\'i <a href="http://jojopil.com" title="Mamaly Filàna">Jojopil</a> teo ambony <a href="http://rubyonrails.com" title="Web Development that doesn\'t hurt">Lalamby</a> tao anaty sehatra ny <a href="http://telomiova.org" title="Internet - Malagasy - Mivelatra">Tetikasa Telomiova</a>.'
  end
  
  def detect_language
    flash[:notice] ||= ""
    cookies.delete :interface_language_code
    if cookies[:interface_language_code].nil?
      langs = request.env["HTTP_ACCEPT_LANGUAGE"].scan(/(?:[^-]|^)(\w\w)(?:$|[^-])/i)
      langs.each do |l|
        my_l = Language.find_by_code_ISO_639_1(l)
        flash[:notice] << "# tryed #{l}<br />"
        if my_l
          cookies[:interface_language_code] = my_l.code_ISO_639_3
          flash[:notice] << "# found that #{l} == #{my_l.code_ISO_639_3} so setted cookies[:interface_language_code] is #{cookies[:interface_language_code]}<br />"
          redirect_to :controller => "welcome" unless cookies[:interface_language_code].nil?
        end
      end
      flash[:notice] << "language is set to #{cookies[:interface_language_code]}<br />"
    end
  end
end
