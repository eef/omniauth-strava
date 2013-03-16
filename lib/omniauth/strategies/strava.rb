require 'omniauth/strategies/oauth2'

module OmniAuth
  module Strategies
    class Strava < OmniAuth::Strategies::OAuth2

      option :fields, [:client_id, :client_secret]
      option :uid_field, :client_id

      option :client_options, {
        :site => 'https://www.strava.com',
        :authorize_url => "https://www.strava.com/oauth/authorize",
        :token_url => '/oauth/token'
      }

      def request_phase

      end

    end
  end
end
