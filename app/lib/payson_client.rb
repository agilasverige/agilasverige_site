module PaysonClient

  PAYSON_STATUSES = {
      "CREATED" => :paid,         # The payment request was received and has been created in Paysons system. Funds will be transferred once approval is received.
      "PENDING" => :paid,         # The sender has a pending transaction. A guarantee payment in progress has status pending. Please check guaranteeStatus for further details.
      "PROCESSING" => :paid,      # The payment is in progress, check again later.
      "COMPLETED" => :paid,       # The senders transaction has completed.
      "CREDITED"  => :failed,     # The senders transaction has been credited.
      "ERROR" => :failed,         # The payment failed and all attempted transfers failed or all completed transfers were successfully reversed.
      "EXPIRED" => :failed,       # A payment requiring approval was not executed within 3 hours.
      "REVERSALERROR" => :failed, # One or more transfers failed when attempting to reverse a payment.
      "ABORTED" => :failed        # The payment was aborted before any money were transferred.
  }

  def self.load_registration_status(user)
    return :not_logged_in unless user

    registration = user.registrations.where(conference_id: Conference.current.id).first

    return :not_started unless registration

    token = registration.payson_token

    unless token.blank?
      payment_details = PaysonAPI::Request::PaymentDetails.new(token)
      response = PaysonAPI::Client.get_payment_details(payment_details)

      return PAYSON_STATUSES.fetch(response.status, :unknown)
    end
    return :not_started
  end
end
