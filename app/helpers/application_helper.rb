# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def content(key, language = :"#{cookies[:interface_language_code]||"mlg"}")
    @content[key][language]
  end
end
