

#
# Monkeypatch the Time class to parse string if at called with a string containing urlencoded timestamp
#
# - Needed because the payson API lib is broken for guarantee payments
#   check out payson_api-0.3.0/lib/payson_api/response/payment_details.rb line 26
class Time

  class << self
    alias super_at at
  end

  def self.at(*several_variants)
    if several_variants.length == 1 and several_variants[0].is_a? String and several_variants[0].include? "%"
      stamp = URI.decode_www_form_component(several_variants[0])

      # Stamp is on this format: 2013-05-07T20:58:23
      DateTime.strptime(stamp, '%Y-%m-%dT%H:%M:%S')
    else
      super_at(*several_variants)
    end
  end
end