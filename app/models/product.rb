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
    "https://www.paypal.com/cgi-bin/webscr?" + values.to_query  
      
#    line_items.each_with_index do |item, index|  
#      values.merge!({  
#        "amount_#{index + 1}" => item.unit_price,  
#        "item_name_#{index + 1}" => item.product.name,  
#        "item_number_#{index + 1}" => item.product.identifier,  
#        "quantity_#{index + 1}" => item.quantity  
#      })  
#    end  
  end    
  
  
end
