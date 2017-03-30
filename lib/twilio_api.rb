class TwilioApi

  def initialize(sid:, token:, twilio_number:)
    @sid = sid
    @token = token
    @twilio_number = twilio_number
  end

  def send_sms(to:, body:)
    client.messages.create(
      from: twilio_number,
      to: to,
      body: body
    )
  end

  private

  attr_reader :client, :sid, :token, :twilio_number

  def client
    @client ||= Twilio::REST::Client.new(sid, token)
  end
end
