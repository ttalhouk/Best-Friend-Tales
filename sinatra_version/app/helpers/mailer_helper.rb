helpers do
  def sendgrid_client
    SendGrid::Client.new(api_key: ENV['SENDGRID_APIKEY'])
  end

  def is_valid_email?(variable)
    variable =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  end
end
