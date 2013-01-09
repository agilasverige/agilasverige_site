module PaysonHelper

  def payment_status(user)
    registration = user.registrations.where(conference_id: Conference.current.id).first
    token = registration.payson_token
    status = ""    

    unless token.blank?
      payment_details = PaysonAPI::Request::PaymentDetails.new(token)
      response = PaysonAPI::Client.get_payment_details(payment_details)

      status = nil
      if response.success?
        status = "Betalstatus: #{response.status}"
      else
        status = "Kunde inte ladda betalstatus #{response.errors}"
      end
      return status
    end

    link_to "Betala", payment_start_path
  end
end
