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
        redirect client.auth_code.authorize_url({:redirect_uri => callback_url}.merge(options.authorize_params))
      end

      uid do
        request.params[options.uid_field.to_s]
      end

      info do
        options.fields.inject({}) do |hash, field|
          hash[field] = request.params[field]
          hash
        end
      end

    end
  end
end
