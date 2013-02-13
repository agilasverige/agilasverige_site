module PaysonClient

  def self.load_registration_status(user)
    return :not_logged_in unless user

    registration = user.registrations.where(conference_id: Conference.current.id).first
    return :not_started unless registration

    token = registration.payson_token

    unless token.blank?
      payment_details = PaysonAPI::Request::PaymentDetails.new(token)
      response = PaysonAPI::Client.get_payment_details(payment_details)

      status = nil
      if response.success?
        # TODO: map these
        return response.status.to_sym
      else
        return :unknown
      end
    end
    return :not_started
  end

end