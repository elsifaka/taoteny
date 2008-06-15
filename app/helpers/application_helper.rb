# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def language_select(user, usage)
    render :partial => "languages/collection_select", :locals => { :object => user, :usage => usage }
  end
end
