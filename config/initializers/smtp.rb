ActionMailer::Base.smtp_settings = {
  domain:         ENV.fetch("SENDGRID_DOMAIN", "").presence,
  address:        "smtp.sendgrid.net",
  port:            587,
  authentication: :plain,
  user_name:      "apikey",
  password:       ENV.fetch("SENDGRID_API_KEY", "").presence
}

# Ports
# 25, 587 (for unencrypted/TLS connections)
# 465 (for SSL connections)
