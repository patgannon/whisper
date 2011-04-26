module ApplicationHelper
  def aloha_scripts
    ["aloha/aloha.js",
    "aloha/plugins/com.gentics.aloha.plugins.Format/plugin.js",
    "aloha/plugins/com.gentics.aloha.plugins.Table/plugin.js",
    "aloha/plugins/com.gentics.aloha.plugins.List/plugin.js",
    "aloha/plugins/com.gentics.aloha.plugins.Link/plugin.js",
    "aloha/plugins/com.gentics.aloha.plugins.HighlightEditables/plugin.js",
    "aloha/plugins/com.gentics.aloha.plugins.TOC/plugin.js",
    "aloha/plugins/com.gentics.aloha.plugins.Link/delicious.js",
    "aloha/plugins/com.gentics.aloha.plugins.Link/LinkList.js",
    "aloha/plugins/com.gentics.aloha.plugins.Paste/plugin.js",
    "aloha/plugins/com.gentics.aloha.plugins.Image/dep/jcrop/jquery.jcrop.js",
    "aloha/plugins/at.tapo.aloha.plugins.Image/plugin.js",
    "aloha/plugins/com.gentics.aloha.plugins.Paste/wordpastehandler.js"]
  end
  
  def paypal_url(return_url)  
    values = {  
      :business => @project.paypal_email_address,  
      :cmd => "_cart",  
      :upload => 1,  
      :return => return_url,  
      :invoice => 123412351234123#  id  
    }  
    index = 0
    values.merge!({
        "amount_#{index + 1}" => 274.50,  
        "item_name_#{index + 1}" => "Diving Course",  
        "item_number_#{index + 1}" => "324623623467",  
        "quantity_#{index + 1}" => 1
    })
      
#    line_items.each_with_index do |item, index|  
#      values.merge!({  
#        "amount_#{index + 1}" => item.unit_price,  
#        "item_name_#{index + 1}" => item.product.name,  
#        "item_number_#{index + 1}" => item.product.identifier,  
#        "quantity_#{index + 1}" => item.quantity  
#      })  
#    end  
    "https://www.#{'sandbox.' if @project.paypal_sandbox}paypal.com/cgi-bin/webscr?" + values.to_query  
  end    
end
