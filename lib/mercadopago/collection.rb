module MercadoPago

  module Collection

    #
    # Receives an access_token and a payment id and retrieves information of the payment.
    # This is useful, for example, to check the status of a payment.
    #
    # - access_token: an access_token of the MercadoPago account associated with the payment to be checked.
    # - payment_id: the id of the payment to be checked.
    #
    def self.notification(access_token, payment_id, sandbox = false)
      MercadoPago::Request.wrap_get("#{sandbox ? '/sandbox' : ''}/collections/notifications/#{payment_id}?access_token=#{access_token}", { accept: 'application/json' })
    end

    def self.get(access_token, payment_id, sandbox = false)
      MercadoPago::Request.wrap_get("#{sandbox ? '/sandbox' : ''}/collections/#{payment_id}?access_token=#{access_token}", { accept: 'application/json' })
    end

    #
    # Receives an access_token and a search_hash and returns matching payments, according to the search params.
    #
    # - access_token: an access_token of the MercadoPago account associated with the payment to be checked.
    # - search_hash: querystring in hash format.
    #
    # == Search parameter valid keys:
    # id::
    #   Payment identifier.
    # site_id::
    #   Country identifier: Argentina: MLA; Brasil: MLB.
    # date_created::
    #   Creation date. Ej: range=date_created&begin_date=NOW-1DAYS&end_date=NOW (Ver ISO-8601).
    # date_approved::
    #   Approval date. Ej: range=date_approved&begin_date=NOW-1DAYS&end_date=NOW (Ver ISO-8601).
    # last_modified::
    #   Last modified date. Ej: range=last_modified&begin_date=NOW-1DAYS&end_date=NOW (Ver ISO-8601).
    # money_release_date::
    #   Date of the payment's release. Ej: range=money_release_date&begin_date=NOW-1DAYS&end_date=NOW (Ver ISO-8601).
    # payer_id::
    #   Buyer's identifier.
    # reason::
    #   Description of what's being payed.
    # transaction_amount::
    #   Amount of the transaction.
    # currency_id::
    #   Currency type. Argentina: ARS (peso argentino);' USD (Dólar estadounidense); Brasil: BRL (Real).
    # external_reference::
    #   Field used by the seller as aditional reference.
    # mercadopago_fee::
    #   MercadoPago's comission fee.
    # net_received_amount::
    #   Amount payable to the seller without mercadopago_fee.
    # total_paid_amount::
    #   Obtained by adding: transaction_amount, shipping_cost and the amount payed by the buyer (including credit card's financing).
    # shipping_cost::
    #   Shipping cost.
    # status::
    #     === Status of the payment:
    #     pending::
    #       The payment process is incomplete.
    #     approved::
    #       The payment has been credited.
    #     in_process::
    #       The payment is under review.
    #     rejected::
    #       The payment has been rejected.
    #     cancelled::
    #       The payment is canceled after timeout or by either party.
    #     refunded::
    #       The payment has been refunded.
    #     in_mediation::
    #       The payment is in dispute.
    # status_detail::
    #   Payment status detail.
    # released::
    #   Wether the amount is available or not. Possible values are yes or no.
    # operation_type::
    #     === Type of operation:
    #     regular_payment::
    #       A payment.
    #     money_transfer::
    #       A money wire.
    #     recurring_payment::
    #       Active subscription recurring payment.
    #     subscription_payment::
    #       Subscription fee.
    #
    def self.search(access_token, search_hash = {})
      query = search_hash.map { |e| e.join('=') }.join('&')

      MercadoPago::Request.wrap_get("/collections/search?access_token=#{access_token}&#{query}", { accept: 'application/json' })
    end

  end

end
