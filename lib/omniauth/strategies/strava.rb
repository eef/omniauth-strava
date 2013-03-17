require 'omniauth/strategies/oauth2'

module OmniAuth
  module Strategies
    class Strava < OmniAuth::Strategies::OAuth2

      option :client_options, {
        :site => 'https://www.strava.com',
        :approval_prompt => "force"
      }

      # uid { raw_info['info']['id'] }

      info do
        ap raw_info
        raw_info
      end

      def raw_info
        @raw_info ||= access_token.get("https://www.strava.com/api/v3/athlete?access_token=#{access_token.token}").parsed
      end

    end
  end
end
