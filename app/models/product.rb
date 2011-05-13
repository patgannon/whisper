class Product
  include Mongoid::Document
  field :name, :type => String
  field :price, :type => String
  belongs_to :project
  validates :project, :presence => true
  validates :name, :presence => true
  validates :price, :presence => true


  def buy_now_url(return_url)  
    values = {  
      :business => self.project.paypal_email_address,  
      :cmd => "_cart",
      :upload => 1,  
      :return => return_url,
      "amount_1" => self.price,  
      "item_name_1" => self.name,  
      "quantity_1" => 1
    }
    "https://#{paypal_host}/cgi-bin/webscr?" + values.to_query  
      
#    line_items.each_with_index do |item, index|  
#      values.merge!({  
#        "amount_#{index + 1}" => item.unit_price,  
#        "item_name_#{index + 1}" => item.product.name,  
#        "item_number_#{index + 1}" => item.product.identifier,  
#        "quantity_#{index + 1}" => item.quantity  
#      })  
#    end  
  end
  
  private
  
  def paypal_host
    self.project.paypal_sandbox ? 
      "www.sandbox.paypal.com" : "www.paypal.com"
  end
end
