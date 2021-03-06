class JsonWebToken

  def self.verify(token)
    JWT.decode token,  Rails.application.secrets.auth0_api_signing_secret,
    true, # Verify the signature of this token
    algorithm: 'HS256',
    iss: "https://#{Rails.application.secrets.auth0_domain}/",
    verify_iss: true,
    aud: Rails.application.secrets.auth0_api_audience,
    verify_aud: true
  end
end
