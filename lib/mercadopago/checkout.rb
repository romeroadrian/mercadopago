module Mercadopago
  
  module Checkout
    
    #
    # Allows you to configure the checkout process.
    # Receives an access_token and a prefereces hash and creates a new checkout preference.
    # Once you have created the checkout preference, you can use the init_point URL
    # to start the payment flow.
    #
    # - access_token: the MercadoPago account associated with this access_token will
    #                 receive the money from the payment of this checkout preference.
    # - data: a hash of preferences that will be trasmitted to checkout API.
    #
    def self.create_preference(access_token, data)
      
      payload = JSON.generate(data)
      headers = { :content_type => 'application/json', :accept => 'application/json' }
      
      Mercadopago::Request.wrap_post("/checkout/preferences?access_token=#{access_token}", payload, headers)
      
    end
    
    #
    # TODO
    #
    def self.get_preference
      
      # TODO
      
    end
    
    #
    # TODO
    #
    def self.update_preference
      
      # TODO
      
    end
    
  end
  
end