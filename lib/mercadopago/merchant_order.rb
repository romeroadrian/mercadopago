module MercadoPago

  module MerchantOrder

    def self.get(access_token, payment_id)
      MercadoPago::Request.wrap_get("merchant_orders/#{payment_id}?access_token=#{access_token}", { accept: 'application/json' })
    end

  end

end
