# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
require 'securerandom'

def secure_token
  token_file = Rails.root.join('.secret')
  if File.exist?(token_file)
    # Use the existing token.
    File.read(token_file).chomp
  else
    # Generate a new token and store it in token_file.
    token = SecureRandom.hex(64)
    File.write(token_file, token)
    token
  end
end

SampleApp3::Application.config.secret_key_base = secure_token


# SampleApp3::Application.config.secret_key_base = 'a0270d8e95f4426d19cce5b94af6966a51ac3606896b75831da24715dfd1b7cf8b936e3c7e4ac45e85356bdabb616f2bb2246a2791088a054fcefe5fc598bddf'
