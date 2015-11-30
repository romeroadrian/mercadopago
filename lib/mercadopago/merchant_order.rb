module MercadoPago

  module MerchantOrder

    def self.get(access_token, payment_id)
      MercadoPago::Request.wrap_get("merchant_orders/#{payment_id}?access_token=#{access_token}", { accept: 'application/json' })
    end

    #
    # Receives an access_token and a merchant order id and retrieves information of the order.
    #
    # - access_token: an access_token of the MercadoPago account associated with the payment to be checked.
    # - merchant_order_id: the id of the order to be checked.
    #
    def self.notification(access_token, merchant_order_id)
      MercadoPago::Request.wrap_get("/merchant_orders/#{merchant_order_id}?access_token=#{access_token}", { accept: 'application/json' })
    end

  end

end
