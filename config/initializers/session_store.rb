# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_clivebaker_session',
  :secret      => 'e7d01f85dc8d9ec16ad4ee12d955fac8cf2fe91f199fd3ad5799c22730d775a5cfd5aad0c8685232c7614e08d3bdc502cfcd2cdf1a41650632afc38545166cf7'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
