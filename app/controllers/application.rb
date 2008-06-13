# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time  
  around_filter :set_locale
  include AuthenticatedSystem

  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => 'fb4c0b67c9c14c01cddef94797b674bc'
  
  private

  # Set the locale from the parameters, the session, or the navigator
  # If none of these works, the Globalite default locale is set (en-*)
  def set_locale
    # Get the current path and request method (useful in the layout for changing the language)
    @current_path = request.env['PATH_INFO']
    @request_method = request.env['REQUEST_METHOD']

    # Try to get the locale from the session, and then from the navigator
    if !current_user.nil? and current_user.ui_lang
      logger.debug "[globalite] Loading locale: #{current_user.ui_lang} from session"
      Locale.code = current_user.ui_lang
    else
      accept_header = get_sorted_locales_from_accept_header
      logger.debug "[globalite] Application accepted locales: #{Globalite.ui_locales.values.to_sentence}"
      my_loc = accept_header.detect {|l| is_matching_ui_locale?(l)}
      if my_loc
        logger.debug "[globalite] #{my_loc}"
        Locale.code = my_loc
      end
    end
    
    logger.debug "[globalite] Locale set to #{Locale.code}"
    # render the page
    yield

    # reset the locale to its default value
    Locale.reset!
  end

  # Get a sorted array of the navigator languages
  def get_sorted_locales_from_accept_header
    accept_langs = (request.env['HTTP_ACCEPT_LANGUAGE'] || "en-us,en;q=0.5").split(/,/) rescue nil
    return nil unless accept_langs

    # Extract langs and sort by weight
    # Example HTTP_ACCEPT_LANGUAGE: "en-au,en-gb;q=0.8,en;q=0.5,ja;q=0.3"
    wl = {}
    accept_langs.each {|accept_lang|
      if (accept_lang + ';q=1') =~ /^(.+?)-(.+?);q=([^;]+).*/
        wl[($3.to_f rescue -1.0)]= $1+"-"+$2.upcase
      elsif (accept_lang + ';q=1') =~ /^(.+?);q=([^;]+).*/
        wl[($2.to_f rescue -1.0)]= $1+"-*"
      end
    }
    sorted_langs = wl.sort{|a,b| b[0] <=> a[0] }.map{|a| a[1] }
    logger.debug "[globalite] Client accepted locales: #{sorted_langs.to_sentence}"
    sorted_langs = wl.sort{|a,b| b[0] <=> a[0] }.map{|a| a[1] }
    sorted_langs
  end

  # Returns the UI locale that best matches with the parameter
  # or nil if not found
  def is_matching_ui_locale?(locale)
    res = false
    lang = locale[0,2].downcase
    if locale[3,5]
      country = locale[3,5].upcase
      logger.debug "[globalite] Trying to match locale: #{lang}-#{country}"
      locale_code = "#{lang}-#{country}".to_sym
    end

    # Check with exact matching or on the language only
    res |= Globalite.ui_locales.values.include?(locale_code)
    unless res
      Globalite.ui_locales.values.each do |ui|
        logger.debug "[globalite] Trying to match language only: #{ui} with #{locale}"
        res |= /#{ui}/i =~ locale ? true : false
      end
    end
    res
  end
  
  
  #  private  
  #  def detect_language
  #    flash[:notice] ||= ""
  #    cookies.delete :interface_language_code
  #    if cookies[:interface_language_code].nil?
  #      langs = request.env["HTTP_ACCEPT_LANGUAGE"].scan(/(?:[^-]|^)(\w\w)(?:$|[^-])/i)
  #      langs.each do |l|
  #        my_l = Language.find_by_code_ISO_639_1(l)
  #        flash[:notice] << "# tryed #{l}<br />"
  #        if my_l
  #          cookies[:interface_language_code] = my_l.code_ISO_639_3
  #          flash[:notice] << "# found that #{l} == #{my_l.code_ISO_639_3} so setted cookies[:interface_language_code] is #{cookies[:interface_language_code]}<br />"
  #          redirect_to :controller => "welcome" unless cookies[:interface_language_code].nil?
  #        end
  #      end
  #      flash[:notice] << "language is set to #{cookies[:interface_language_code]}<br />"
  #    end
end