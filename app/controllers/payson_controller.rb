class PaysonController < ApplicationController
  before_filter :authenticate_user!

  def payment_start
    return_url = payment_success_url
    cancel_url = payment_cancel_url
    ipn_url = payment_ipn_url
    memo = 'Konferensavgift Agila Sverige'

    receivers = [ PaysonAPI::Receiver.new(email = 'info@agilasverige.se',
                                          amount = 3750,
                                          first_name = 'Agila',
                                          last_name = 'Sverige',
                                          primary = true) ] 

    sender = PaysonAPI::Sender.new(email = current_user.email,
                                   first_name = current_user.first_name,
                                   last_name = current_user.last_name)

    order_items = [ PaysonAPI::OrderItem.new(description = 'Agila Sverige 2014',
                                             unit_price = 3000,
                                             quantity = 1,
                                             tax = 0.25,
                                             sku = 'AS-2014') ]

    payment = PaysonAPI::Request::Payment.new(return_url,
                                              cancel_url,
                                              ipn_url,
                                              memo,
                                              sender,
                                              receivers)
    payment.order_items = order_items

#    payment.fundings = [ PaysonAPI::Funding.new('INVOICE') ]
    response = PaysonAPI::Client.initiate_payment(payment)

    if response.success?
      redirect_to response.forward_url
    else
      raise Exception, response.errors
    end
  end

  def payment_success
    token = params['TOKEN']
    reg = current_user.registrations.where(conference_id: Conference.current.id).first
    reg = Registration.create!(conference_id: Conference.current.id, user_id: current_user.id) unless reg
    reg.payson_token = token
    reg.save!
    redirect_to user_path(current_user.id)
  end

  def payment_cancel
    redirect_to user_path(current_user.id)
  end

  def payment_ipn
    Ipn.create!(data: "Parameters: " + params.to_json + "\nBody: " + request.body.read())
  end
end
