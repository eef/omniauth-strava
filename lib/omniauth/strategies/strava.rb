require 'omniauth/strategies/oauth2'

module OmniAuth
  module Strategies
    class Strava < OmniAuth::Strategies::OAuth2

      option :client_options, {
        :site          => 'https://www.strava.com'
      }

      # uid{ raw_info['id'] || verified_email }

      info do
        puts raw_info
      end

      def raw_info
        @raw_info ||= access_token.get('https://www.strava.com/oauth/athlete').parsed
      end

    end
  end
end
