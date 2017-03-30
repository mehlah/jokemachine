require "twilio_api"

class SendJokeJob < ApplicationJob
  def perform(to:)
    joke = Joke.last
    twilio.send_sms(content: joke.content, to: to)
  end

  private

  def twilio
    TwilioApi.new(
      sid: ENV.fetch("TWILIO_SID"),
      token: ENV.fetch("TWILIO_TOKEN"),
      twilio_number: ENV.fetch("TWILIO_NUMBER")
    )
  end
end
