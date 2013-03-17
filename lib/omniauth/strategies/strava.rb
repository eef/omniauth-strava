require 'omniauth/strategies/oauth2'

module OmniAuth
  module Strategies
    class Strava < OmniAuth::Strategies::OAuth2

      option :fields, [:client_id, :client_secret]
      option :uid_field, :code

      option :client_options, {
        :site => 'https://www.strava.com/oauth',
        :authorize_url => "https://www.strava.com/oauth/authorize",
        :token_url => 'https://www.strava.com/oauth/token'
      }

      def request_phase
        params = {}
        params["state"] = "strava"
        params["approval_prompt"] = "force"
        params["response_type"] = "code"
        params["scope"] = "view_private"
        query = Rack::Utils.build_query(params)
        url = client.auth_code.authorize_url({:redirect_uri => callback_url})
        url << "?" unless url.match(/\?/)
        url << "&" unless url.match(/[\&\?]$/)
        url << query
        puts "s*"*100
        puts options.inspect
        puts url
        puts "*"*100
        redirect url
      end

      def callback_phase
        token = client.auth_code.get_token(request.params["code"], :redirect_uri => callback_url)
        puts "Token: #{token.inspect}"
        super
      end

      uid do
        puts request.inspect
        request.params[options.uid_field.to_s]
      end

      info do
        options.fields.inject({}) do |hash, field|
          hash[field] = request.params[field]
          Rails.logger.info "*"*100
          Rails.logger.info hash.inspect
          Rails.logger.info "*"*100
          hash
        end
      end

    end
  end
end
